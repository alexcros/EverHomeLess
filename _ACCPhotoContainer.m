// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ACCPhotoContainer.m instead.

#import "_ACCPhotoContainer.h"

const struct ACCPhotoContainerAttributes ACCPhotoContainerAttributes = {
	.photoData = @"photoData",
};

const struct ACCPhotoContainerRelationships ACCPhotoContainerRelationships = {
	.notes = @"notes",
};

@implementation ACCPhotoContainerID
@end

@implementation _ACCPhotoContainer

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"PhotoContainer" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"PhotoContainer";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"PhotoContainer" inManagedObjectContext:moc_];
}

- (ACCPhotoContainerID*)objectID {
	return (ACCPhotoContainerID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic photoData;

@dynamic notes;

- (NSMutableSet*)notesSet {
	[self willAccessValueForKey:@"notes"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"notes"];

	[self didAccessValueForKey:@"notes"];
	return result;
}

@end

