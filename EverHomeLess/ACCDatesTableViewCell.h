//
//  ACCDatesTableViewCell.h
//  EverHomeLess
//
//  Created by Alexandre Cros on 09/02/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ACCNote;

@interface ACCDatesTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *creationLabel;
@property (weak, nonatomic) IBOutlet UILabel *modificationLabel;
@property (strong, nonatomic) ACCNote *note;
+(CGFloat)height;

+(NSString*)cellId;



@end

