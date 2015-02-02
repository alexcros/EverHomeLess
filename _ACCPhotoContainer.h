// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ACCPhotoContainer.h instead.

@import CoreData;

extern const struct ACCPhotoContainerAttributes {
	__unsafe_unretained NSString *photoData;
} ACCPhotoContainerAttributes;

extern const struct ACCPhotoContainerRelationships {
	__unsafe_unretained NSString *notes;
} ACCPhotoContainerRelationships;

@class ACCNote;

@interface ACCPhotoContainerID : NSManagedObjectID {}
@end

@interface _ACCPhotoContainer : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ACCPhotoContainerID* objectID;

@property (nonatomic, strong) NSData* photoData;

//- (BOOL)validatePhotoData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *notes;

- (NSMutableSet*)notesSet;

@end

@interface _ACCPhotoContainer (NotesCoreDataGeneratedAccessors)
- (void)addNotes:(NSSet*)value_;
- (void)removeNotes:(NSSet*)value_;
- (void)addNotesObject:(ACCNote*)value_;
- (void)removeNotesObject:(ACCNote*)value_;

@end

@interface _ACCPhotoContainer (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePhotoData;
- (void)setPrimitivePhotoData:(NSData*)value;

- (NSMutableSet*)primitiveNotes;
- (void)setPrimitiveNotes:(NSMutableSet*)value;

@end
