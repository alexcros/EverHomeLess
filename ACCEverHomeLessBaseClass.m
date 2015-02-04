//
//  ACCEverHomeLessBaseClass.m
//  EverHomeLess
//
//  Created by Alexandre Cros on 03/02/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import "ACCEverHomeLessBaseClass.h"

@implementation ACCEverHomeLessBaseClass

// copy paste del notebook, modificado
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
    [super willTurnIntoFault];
    
    [self tearDownKVO];
    
}
#pragma mark - Utils
// implementacion del for
-(NSArray*)observableKeys{
    return nil;
}

#pragma mark - KVO

-(void)setupKVO{
    // Alta en notificaciones para las propiedades que quiero observar
    
    // por cada clave que me devuelve un metoodo que se va a llamar observableKeys
    // necesitamos una implementacion
    //opciones para que te pase valor antiguo y nuevo (no no hace falta: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld )
    for (NSString * key in [self observableKeys]) {
        [self addObserver:self
               forKeyPath:key
                  options:0
                  context:NULL];
    }
    
}
-(void) tearDownKVO{
    // Baja en todas las listas de spam
    for (NSString *key in [self observableKeys]) {// entre las 2 entidades solo cambian los observableKeys
        
        [self removeObserver:self
                  forKeyPath:key];
    }
}
/* obsolete
-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context {
    // solo me interesa saber que algo ha cambiado
    self.modificationDate = [NSDate date];
    
}
*/
@end
