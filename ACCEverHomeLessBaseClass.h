//
//  ACCEverHomeLessBaseClass.h
//  EverHomeLess
//
//  Created by Alexandre Cros on 03/02/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

@import CoreData;

@interface ACCEverHomeLessBaseClass : NSManagedObject

// copy pasta del notebook, modificado
-(NSArray*)observableKeys;
-(void)setupKVO;
-(void) tearDownKVO;

@end
