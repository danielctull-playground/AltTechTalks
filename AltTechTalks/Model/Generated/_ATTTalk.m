// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ATTTalk.m instead.

#import "_ATTTalk.h"

const struct ATTTalkAttributes ATTTalkAttributes = {
	.detail = @"detail",
	.imageName = @"imageName",
	.speaker = @"speaker",
	.title = @"title",
};

const struct ATTTalkRelationships ATTTalkRelationships = {
};

const struct ATTTalkFetchedProperties ATTTalkFetchedProperties = {
};

@implementation ATTTalkID
@end

@implementation _ATTTalk

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ATTTalk" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ATTTalk";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ATTTalk" inManagedObjectContext:moc_];
}

- (ATTTalkID*)objectID {
	return (ATTTalkID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic detail;






@dynamic imageName;






@dynamic speaker;






@dynamic title;











@end
