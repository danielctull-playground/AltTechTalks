// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ATTSpeaker.m instead.

#import "_ATTSpeaker.h"

const struct ATTSpeakerAttributes ATTSpeakerAttributes = {
	.detail = @"detail",
	.imageName = @"imageName",
	.name = @"name",
	.talkTitle = @"talkTitle",
};

const struct ATTSpeakerRelationships ATTSpeakerRelationships = {
};

const struct ATTSpeakerFetchedProperties ATTSpeakerFetchedProperties = {
};

@implementation ATTSpeakerID
@end

@implementation _ATTSpeaker

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ATTSpeaker" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ATTSpeaker";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ATTSpeaker" inManagedObjectContext:moc_];
}

- (ATTSpeakerID*)objectID {
	return (ATTSpeakerID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic detail;






@dynamic imageName;






@dynamic name;






@dynamic talkTitle;











@end
