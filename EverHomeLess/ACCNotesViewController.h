//
//  ACCNotesViewController.h
//  EverHomeLess
//
//  Created by Alexandre Cros on 04/02/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import "AGTCoreDataTableViewController.h"
#import "ACCNotebook.h"

@interface ACCNotesViewController : AGTCoreDataTableViewController

@property (strong, nonatomic) ACCNotebook *notebook;

@end
