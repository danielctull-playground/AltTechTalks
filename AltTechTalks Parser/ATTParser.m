//
//  ATTParser.m
//  AltTechTalks
//
//  Created by Daniel Tull on 15.12.2013.
//  Copyright (c) 2013 Daniel Tull. All rights reserved.
//

#import "ATTParser.h"
#import "AltTechTalks.h"
#import "ATTSpeaker.h"
#import <DCTCoreDataStack/DCTCoreDataStack.h>

@interface ATTParser ()
@property (nonatomic) NSString *bundle;
@end

@implementation ATTParser

#pragma mark - DDCliApplicationDelegate

- (int)application:(DDCliApplication *)application runWithArguments:(NSArray *)arguments {

	// Load the bundle from the given path and get the model and store URLs
	NSURL *bundleURL = [[NSURL alloc] initFileURLWithPath:self.bundle];
	NSBundle *bundle = [NSBundle bundleWithURL:bundleURL];
	NSURL *storeURL = [AltTechTalks storeURLForBundle:bundle];
	NSURL *modelURL = [AltTechTalks modelURLForBundle:bundle];

	// Remove the old store to parse a fresh set of data

	NSError *error = nil;
	NSFileManager *fileManager = [NSFileManager new];
	BOOL didRemove = [fileManager removeItemAtURL:storeURL error:&error];
	if (!didRemove) NSLog(@"%@:%@ %@", self, NSStringFromSelector(_cmd), error);

	// Setup a core data stack
	DCTCoreDataStack *coreDataStack = [[DCTCoreDataStack alloc] initWithStoreURL:storeURL
																	   storeType:NSSQLiteStoreType
																	storeOptions:nil
															  modelConfiguration:nil
																		modelURL:modelURL];

	NSURL *dataURL = [NSURL URLWithString:@"http://london.alttechtalks.com"];
	NSURLRequest *request = [NSURLRequest requestWithURL:dataURL];
	NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:NULL];

	NSError *XMLError = nil;
	NSXMLDocument *XMLDocument = [[NSXMLDocument alloc] initWithData:data options:NSXMLDocumentTidyHTML error:&XMLError];
	if (!XMLDocument) NSLog(@"%@:%@ %@", self, NSStringFromSelector(_cmd), XMLError);

	NSArray *talkNodes = [XMLDocument.rootElement nodesForXPath:@"//ul[@class='media-list']/li[@class='media']" error:NULL];

	for (NSXMLNode *node in talkNodes) {

		ATTSpeaker *speaker = [ATTSpeaker insertInManagedObjectContext:coreDataStack.managedObjectContext];

		// Find the image
		NSArray *imageNodes = [node nodesForXPath:@"img" error:NULL];
		NSXMLElement *imageNode = [imageNodes firstObject];
		NSXMLNode *imageSRC = [imageNode attributeForName:@"src"];
		NSString *imageLocation = imageSRC.stringValue;

		// Create the full URL for the image
		NSURL *remoteImageURL = [NSURL URLWithString:imageLocation relativeToURL:dataURL];

		// Create a unique filename by base64 encoding
		NSData *imageLocationData = [imageLocation dataUsingEncoding:NSUTF8StringEncoding];
		NSString *imageFilename = [imageLocationData base64EncodedStringWithOptions:0];
		speaker.imageName = imageFilename;
		NSURL *bundleImageURL = [bundleURL URLByAppendingPathComponent:imageFilename];

		// Download the image and save it to the bundle
		NSURLRequest *imageRequest = [NSURLRequest requestWithURL:remoteImageURL];
		NSData *imageData = [NSURLConnection sendSynchronousRequest:imageRequest returningResponse:NULL error:NULL];
		[fileManager createFileAtPath:[bundleImageURL path] contents:imageData attributes:nil];

		NSLog(@"%@:%@ %@ %@", self, NSStringFromSelector(_cmd), imageLocation, remoteImageURL);

		// Get the talk detail
		NSArray *paragraphNodes = [node nodesForXPath:@"p" error:NULL];
		NSXMLNode *paragraphNode = [paragraphNodes firstObject];
		speaker.detail = paragraphNode.stringValue;

		NSArray *headingNodes = [node nodesForXPath:@"div[@class='media-body']/h4[@class='media-heading']" error:NULL];
		NSXMLNode *headingNode = [headingNodes firstObject];
		NSString *heading = headingNode.stringValue;

		NSArray *components = [heading componentsSeparatedByString:@" - \""];
		speaker.name = [components firstObject];
		speaker.talkTitle = [[components lastObject] stringByReplacingOccurrencesOfString:@"\"" withString:@""];
	}

	NSError *saveError = nil;
	BOOL didSave = [coreDataStack.managedObjectContext save:&saveError];
	if (!didSave) NSLog(@"%@:%@ %@", self, NSStringFromSelector(_cmd), saveError);

	return 0;
}

- (void)application:(DDCliApplication *)application willParseOptions:(DDGetoptLongParser *)optionParser {

	DDGetoptOption optionTable[] = {
        // Long      Short   Argument options
        {@"bundle",  'b',    DDGetoptRequiredArgument},
        {nil,         0,     0},
    };
    [optionParser addOptionsFromTable:optionTable];
}

@end
