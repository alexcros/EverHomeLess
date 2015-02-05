//
//  ACCNotebookTableViewCell.m
//  EverHomeLess
//
//  Created by Alexandre Cros on 05/02/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import "ACCNotebookTableViewCell.h"

@implementation ACCNotebookTableViewCell


// mostrar libretas del EverHomeLess

+(CGFloat)height{
    
    return 60.0f;// float
}

+(NSString*)cellId{
    return [self description];
}

    

// arcaidin . serializa
- (void)awakeFromNib {
    // Initialization code
}

// si quieres cambiar algo en el aspecto
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
