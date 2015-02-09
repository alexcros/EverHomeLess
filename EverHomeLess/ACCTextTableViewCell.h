//
//  ACCTextTableViewCell.h
//  EverHomeLess
//
//  Created by Alexandre Cros on 09/02/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//
@import UIKit;
@class ACCNote;

@interface ACCTextTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *textView;

@property (strong, nonatomic) ACCNote *note;

+ (CGFloat)height;
+ (NSString *)cellId;

@end