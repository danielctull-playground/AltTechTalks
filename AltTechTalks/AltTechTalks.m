//
//  AltTechTalks.m
//  AltTechTalks
//
//  Created by Daniel Tull on 15.12.2013.
//  Copyright (c) 2013 Daniel Tull. All rights reserved.
//

#import "AltTechTalks.h"

static NSString *const AltTechTalksBundleName = @"AltTechTalks Bundle.bundle";

@implementation AltTechTalks

+ (NSBundle *)bundle {
	static NSBundle *bundle;
	static dispatch_once_t bundleToken;
	dispatch_once(&bundleToken, ^{
		NSDirectoryEnumerator *enumerator = [[NSFileManager new] enumeratorAtURL:[[NSBundle mainBundle] bundleURL]
													  includingPropertiesForKeys:nil
																		 options:NSDirectoryEnumerationSkipsHiddenFiles
																	errorHandler:NULL];

		for (NSURL *URL in enumerator)
			if ([[URL lastPathComponent] isEqualToString:AltTechTalksBundleName])
				bundle = [NSBundle bundleWithURL:URL];
	});

	return bundle;
}

+ (NSURL *)modelURLForBundle:(NSBundle *)bundle {
	return [bundle URLForResource:@"Model" withExtension:@"momd"];

}

+ (NSURL *)storeURLForBundle:(NSBundle *)bundle {

	NSString *name = @"data";
	NSString *extension = @"sqlite";
	NSURL *URL = [bundle URLForResource:name withExtension:extension];

	if (!URL) {
		NSString *fullname = [name stringByAppendingPathExtension:extension];
		URL = [[bundle bundleURL] URLByAppendingPathComponent:fullname];
	}

	return URL;
}

+ (NSURL *)URLForImageNamed:(NSString *)imageName inBundle:(NSBundle *)bundle {
	return [bundle URLForResource:imageName withExtension:nil];
}

@end
