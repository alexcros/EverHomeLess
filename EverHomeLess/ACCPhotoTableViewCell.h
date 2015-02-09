//
//  ACCPhotoTableViewCell.h
//  EverHomeLess
//
//  Created by Alexandre Cros on 10/02/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ACCNote;

@interface ACCPhotoTableViewCell : UITableViewCell

+(CGFloat)height;
+(NSString*)cellId;


@property (weak, nonatomic) IBOutlet UIImageView *photoView;

@property (nonatomic, strong) ACCNote *note;


@end
