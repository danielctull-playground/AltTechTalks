//
//  ATTSpeakersViewController.m
//  AltTechTalks
//
//  Created by Daniel Tull on 15.12.2013.
//  Copyright (c) 2013 Daniel Tull. All rights reserved.
//

#import "ATTSpeakersViewController.h"
#import "AltTechTalks.h"
#import "ATTSpeaker.h"
#import "ATTSpeakerTableViewCell.h"
#import <DCTCoreDataStack/DCTCoreDataStack.h>

@interface ATTSpeakersViewController ()
@property (nonatomic) DCTCoreDataStack *coreDataStack;
@property (nonatomic) NSArray *speakers;
@end

@implementation ATTSpeakersViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	NSBundle *bundle = [AltTechTalks bundle];
	NSURL *storeURL = [AltTechTalks storeURLForBundle:bundle];
	NSURL *modelURL = [AltTechTalks modelURLForBundle:bundle];
	NSDictionary *storeOptions = @{ NSReadOnlyPersistentStoreOption : @YES };

	// Setup a core data stack
	self.coreDataStack = [[DCTCoreDataStack alloc] initWithStoreURL:storeURL
														  storeType:NSSQLiteStoreType
													   storeOptions:storeOptions
												 modelConfiguration:nil
														   modelURL:modelURL];

	NSManagedObjectContext *context = self.coreDataStack.managedObjectContext;
	NSError *fetchError = nil;
	NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:[ATTSpeaker entityName]];
	request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:ATTSpeakerAttributes.name ascending:YES]];
	self.speakers = [context executeFetchRequest:request error:&fetchError];

	if (!self.speakers) NSLog(@"%@:%@ %@", self, NSStringFromSelector(_cmd), fetchError);
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.speakers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	ATTSpeaker *speaker = [self.speakers objectAtIndex:indexPath.row];
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
	cell.textLabel.text = speaker.name;
	NSURL *imageURL = [AltTechTalks URLForImageNamed:speaker.imageName inBundle:[AltTechTalks bundle]];
	cell.imageView.image = [UIImage imageWithContentsOfFile:imageURL.path];
	return cell;
}

@end
