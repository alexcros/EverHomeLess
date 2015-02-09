//
//  PhotoTableViewCell.h
//  EverHomeLess
//
//  Created by Alexandre Cros on 05/02/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

@import UIKit;
@class ACCNote;

@interface PhotoTableViewCell : UITableViewCell


+(CGFloat)height;

+(NSString*)cellId;

@property (strong,nonatomic) ACCNote *note;
@property (strong,nonatomic) PhotoTableViewCell *photoView;

@end
