//
//  AppDelegate.m
//  EverHomeLess
//
//  Created by Alexandre Cros on 02/02/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import "AppDelegate.h"
#import "AGTCoreDataStack.h"
#import "ACCNotebook.h"
#import "ACCNotebooksViewController.h"
#import "ACCNote.h"
#import "ACCPhotoContainer.h"
#import "UIViewController+Navigation.h"


@interface AppDelegate ()
@property (nonatomic, strong) AGTCoreDataStack *stack; // var de coreDataStack
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // creamos el stack
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    
    self.stack = [AGTCoreDataStack coreDataStackWithModelName:@"Model"];
    
    //creamos datos chorras
    [self createDummyData];
    //trastear
    //[self trastearConDatos];
    
    // creamos el conjunto de datos
    NSFetchRequest *r =[NSFetchRequest fetchRequestWithEntityName:[ACCNotebook entityName]];
    r.fetchBatchSize = 30;
    r.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:ACCNoteAttributes.name
                                                        ascending:YES
                                                         selector:@selector(caseInsensitiveCompare:)],
                          [NSSortDescriptor sortDescriptorWithKey:ACCNoteAttributes.modificationDate
                                                        ascending:NO]];
    
    NSFetchedResultsController *fc = [[NSFetchedResultsController alloc]initWithFetchRequest:r managedObjectContext:self.stack.context sectionNameKeyPath:nil cacheName:nil];
    
    
    // creamos el controlador
    ACCNotebooksViewController *nbVC = [[ACCNotebooksViewController alloc] initWithFetchedResultsController:fc style:UITableViewStylePlain];
    
    
    // lo metemos en un Navigation Controller
    //UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:nbVC];
    
    
    
    // lo mostramos
   // self.window.rootViewController = nav;
    self.window.rootViewController = [nbVC accWrappedInNavigation];
    //self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void) createDummyData{
    // masacro
    [self.stack zapAllData];
    // entrar datos chorra
    ACCNotebook *nb = [ACCNotebook notebookWithName:@"Exnovias para el recuerdo"
                                            context:self.stack.context];
    [ACCNote noteWithName:@"MAriana Davalos"
                 notebook:nb
                  context:self.stack.context];
    [ACCNote noteWithName:@"Camila Davalos"
                 notebook:nb
                  context:self.stack.context];
    [ACCNote noteWithName:@"PAmpita"
                 notebook:nb
                  context:self.stack.context];
    //fisgoneamos
  /*  NSLog(@"Libreta: %@"),nb;
    NSLog(@"Exs: %@", nb.notes); */
}

-(void) trastearConDatos{
 //creamos libreta
    ACCNotebook *apps = [ACCNotebook notebookWithName:@"Ideas de apps"
                                              context:self.stack.context];
    
    ACCNote *iCachete = [ACCNote noteWithName:@"iCachete" notebook:apps
                                      context:self.stack.context];
    
    // Comprobar que modificationDate se actualiza
    NSLog(@"Antes: %@", iCachete.modificationDate);
    iCachete.text = @"App educativa para reforzar la coordinación motora fina y los reflejos";
    NSLog(@"Después: %@", iCachete.modificationDate);
    
    // Busqueda
    NSFetchRequest *r = [NSFetchRequest fetchRequestWithEntityName:[ACCNote entityName]];
    r.fetchBatchSize = 20;
  /*  r.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:ACCNoteAttributes.name
                                                        ascending:YES],[NSSortDescriptor sortDescriptorWithKey:ACCNoteAttributes.modificationDate
                                                                                                     ascending:NO]];*/
    // ordenacion con caseInsensitiveCOmpare
    r.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:ACCNoteAttributes.name
                                                        ascending:YES selector:@selector(caseInsensitiveCompare:)],[NSSortDescriptor sortDescriptorWithKey:ACCNoteAttributes.modificationDate
                                                                                                     ascending:NO]];

// NSPredicated
    //solo notas que esten en la libreta de apps 
    r.predicate = [NSPredicate predicateWithFormat:@"notebook == %@", apps];
    
NSError *err = nil;

NSArray *res = [self.stack.context executeFetchRequest:r
                                                 error:&err];

    if (res == nil) {
        // Error
        NSLog(@"Error al buscar: %@", err);
    } else {
        NSLog(@"Número de notas: %lu", (unsigned long)[res count]);
        NSLog(@" las notas: %@", res);
        
        // De verdad es un array?
        // No se debe obligar a cargar todo en memoria (res class). Sólo para ejemplo
        NSLog(@"Clase: %@", [res class]);
    }
    
    
    //borrar
    [self.stack.context deleteObject:apps]; //borro libreta
    
    r.predicate = nil;
    res = [self.stack.context executeFetchRequest:r
                                            error:&err];
    
    if (res== nil) {
        NSLog(@"Eerrro al buscar de nuevo: %@", res);
    }
    
    NSLog(@"Notas existentes: %@", res);
    // guardamos
    [self.stack saveWithErrorBlock:^(NSError *error) {
        NSLog(@"Error al gfuardar, cauento. %@", error);
    }];
    
}

@end
