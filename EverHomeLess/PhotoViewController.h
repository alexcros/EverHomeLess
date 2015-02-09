//
//  PhotoViewController.h
//  EverHomeLess
//
//  Created by Alexandre Cros on 05/02/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

@import UIKit;
#import "ACCNote.h"

@interface PhotoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *photoView;
- (IBAction)deletePhoto:(id)sender;
- (IBAction)takePhoto:(id)sender;

-(id)initWithModel:(ACCNote*) model;

@end
