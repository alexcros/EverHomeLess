#import "_ACCNotebook.h"
@import Foundation;

@interface ACCNotebook : _ACCNotebook {}
// C+(instancetype) noteWithName:(NSString*) name
//context:(NSManagedObjectContext*) context;

+(instancetype) notebookWithName: (NSString*) name
                         context: (NSManagedObjectContext*) context;

@end
