//
//  ACCPhotoTableViewCell.m
//  EverHomeLess
//
//  Created by Alexandre Cros on 10/02/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import "ACCPhotoTableViewCell.h"
#import "ACCNote.h"
#import "ACCPhotoContainer.h"

@implementation ACCPhotoTableViewCell

#pragma mark - Properties
-(void) setNote:(ACCNote *)note{
    
    // Guardamos la nota
    _note = note;
    
    // Sincronizamos los datos de la nota con la vista
    if (note.photo.image) {
        self.photoView.image = note.photo.image;
    }
    
    
}

#pragma mark - Class Mehtods
+(CGFloat)height{
    
    return 320.0f;
}

+(NSString*)cellId{
    return [self description];
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
