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
/* obsolete
#pragma mark - Lifecycle

-(void) awakeFromInsert{
    [super awakeFromInsert];
    // call 1 time
    [self setupKVO];
}

-(void) awakeFromFetch{
    [super awakeFromFetch];
    
    // call many times
    [self setupKVO];
    
}

-(void) willTurnIntoFault{
    [self willTurnIntoFault];
    
    [self tearDownKVO];
    
}
 */
#pragma mark - Utils
// implementacion del for
-(NSArray*)observableKeys{
    return @[ACCNoteAttributes.name,
             ACCNoteAttributes.text,
             ACCNoteRelationships.photo,
             ACCNoteRelationships.notebook,
             @"photo.photoData"];
}

#pragma mark - KVO
/*
-(void)setupKVO{
    // Alta en notificaciones para las propiedades que quiero observar
    
    // por cada clave que me devuelve un metoodo que se va a llamar observableKeys
    // necesitamos una implementacion
    
    for (NSString* key in [self observableKeys]) {
        
        [self addObserver:self
               forKeyPath:key // or method
                  options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                  context:NULL];
        
    }
    
}
 obsolete: new class
-(void) tearDownKVO{
    // Baja en todas las listas de spam
    for (NSString *key in [self observableKeys]) {// entre las 2 entidades solo cambian los observableKeys
        
        [self removeObserver:self
                  forKeyPath:key];
    }
}
*/
-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context {
    // solo me interesa saber que algo ha cambiado
    self.modificationDate = [NSDate date];
    
}
 
@end
