//
//  ACCNotebookTableViewCell.h
//  EverHomeLess
//
//  Created by Alexandre Cros on 05/02/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ACCNotebookTableViewCell : UITableViewCell

@property (weak,nonatomic) IBOutlet UILabel *nameView;
@property (weak,nonatomic) IBOutlet UILabel *notesView;

+(CGFloat)height;
+(NSString*)cellId;

@end
