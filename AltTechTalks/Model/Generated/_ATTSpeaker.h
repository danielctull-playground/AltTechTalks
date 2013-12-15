// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ATTSpeaker.h instead.

#import <CoreData/CoreData.h>


extern const struct ATTSpeakerAttributes {
	__unsafe_unretained NSString *detail;
	__unsafe_unretained NSString *imageName;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *talkTitle;
} ATTSpeakerAttributes;

extern const struct ATTSpeakerRelationships {
} ATTSpeakerRelationships;

extern const struct ATTSpeakerFetchedProperties {
} ATTSpeakerFetchedProperties;







@interface ATTSpeakerID : NSManagedObjectID {}
@end

@interface _ATTSpeaker : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ATTSpeakerID*)objectID;





@property (nonatomic, strong) NSString* detail;



//- (BOOL)validateDetail:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* imageName;



//- (BOOL)validateImageName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* talkTitle;



//- (BOOL)validateTalkTitle:(id*)value_ error:(NSError**)error_;






@end

@interface _ATTSpeaker (CoreDataGeneratedAccessors)

@end

@interface _ATTSpeaker (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveDetail;
- (void)setPrimitiveDetail:(NSString*)value;




- (NSString*)primitiveImageName;
- (void)setPrimitiveImageName:(NSString*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitiveTalkTitle;
- (void)setPrimitiveTalkTitle:(NSString*)value;




@end
