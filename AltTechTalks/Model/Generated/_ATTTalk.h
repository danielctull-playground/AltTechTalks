// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ATTTalk.h instead.

#import <CoreData/CoreData.h>


extern const struct ATTTalkAttributes {
	__unsafe_unretained NSString *detail;
	__unsafe_unretained NSString *imageName;
	__unsafe_unretained NSString *speaker;
	__unsafe_unretained NSString *title;
} ATTTalkAttributes;

extern const struct ATTTalkRelationships {
} ATTTalkRelationships;

extern const struct ATTTalkFetchedProperties {
} ATTTalkFetchedProperties;







@interface ATTTalkID : NSManagedObjectID {}
@end

@interface _ATTTalk : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ATTTalkID*)objectID;





@property (nonatomic, strong) NSString* detail;



//- (BOOL)validateDetail:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* imageName;



//- (BOOL)validateImageName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* speaker;



//- (BOOL)validateSpeaker:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;






@end

@interface _ATTTalk (CoreDataGeneratedAccessors)

@end

@interface _ATTTalk (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveDetail;
- (void)setPrimitiveDetail:(NSString*)value;




- (NSString*)primitiveImageName;
- (void)setPrimitiveImageName:(NSString*)value;




- (NSString*)primitiveSpeaker;
- (void)setPrimitiveSpeaker:(NSString*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




@end
