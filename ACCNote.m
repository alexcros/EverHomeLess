#import "ACCNote.h"
#import "ACCPhotoContainer.h"
#import "ACCNotebook.h"

@interface ACCNote ()

// Private interface goes here.

@end

@implementation ACCNote

+(instancetype) noteWithName:(NSString*) name
                    notebook:(ACCNotebook*) notebook
                     context:(NSManagedObjectContext*) context{
    
    ACCNote *note = [self insertInManagedObjectContext:context];
    
    note.name = name;
    note.notebook = notebook;
    note.creationDate = [NSDate date];
    note.photo = [ACCPhotoContainer insertInManagedObjectContext:context];
    note.modificationDate = [NSDate date];
    
    return note;
    
    
}

@end
