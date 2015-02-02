#import "ACCNotebook.h"

@interface ACCNotebook ()

// Private interface goes here.

@end

@implementation ACCNotebook

+(instancetype) notebookWithName: (NSString*) name
                         context: (NSManagedObjectContext*) context{
    
    ACCNotebook *notebook = [self insertInManagedObjectContext:context];
    
    notebook.name = name;
    notebook.creationDate = [NSDate date];
    notebook.modificationDate = [NSDate date];
    
    return notebook;
    
}

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
#pragma mark - Utils
// implementacion del for
-(NSArray*)observableKeys{
    return @[ACCNotebookAttributes.name,// created with mogenerator :)
             ACCNotebookRelationships.notes];//created with mogenerator :)
}

#pragma mark - KVO

-(void)setupKVO{
    // Alta en notificaciones para las propiedades que quiero observar
    
    // por cada clave que me devuelve un metoodo que se va a llamar observableKeys
    // necesitamos una implementacion
    
    for (id key in [self observableKeys]) {
        
        [self addObserver:self
               forKeyPath:key // or method
                  options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                  context:NULL];
        
    }
   
}
-(void) tearDownKVO{
    // Baja en todas las listas de spam
    for (NSString *key in [self observableKeys]) {
        
        [self removeObserver:self
                  forKeyPath:key];
    }
}

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context {
    // solo me interesa saber que algo ha cambiado
    self.modificationDate = [NSDate date];
    
}











@end
