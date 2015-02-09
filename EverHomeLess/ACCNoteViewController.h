//
//  ACCNoteViewController.h
//  EverHomeLess
//
//  Created by Alexandre Cros on 10/02/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ACCNote;

@interface ACCNoteViewController : UITableViewController

@property (nonatomic, strong) ACCNote *note;

-(id) initWithModel:(ACCNote*) model;

@end
