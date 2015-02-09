//
//  ACCNameTableViewCell.h
//  EverHomeLess
//
//  Created by Alexandre Cros on 05/02/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

@import UIKit;

@class ACCNote;

@interface ACCNameTableViewCell : UITableViewCell

//enlazar
@property (weak,nonatomic) IBOutlet UITextField *nameField;

@property (nonatomic, strong)ACCNote *note;

+(CGFloat)height;

+(NSString*)cellId;



@end
