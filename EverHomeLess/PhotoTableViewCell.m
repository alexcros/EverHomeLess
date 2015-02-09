//
//  PhotoTableViewCell.m
//  EverHomeLess
//
//  Created by Alexandre Cros on 05/02/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import "PhotoTableViewCell.h"
#import "ACCNote.h"
#import "ACCPhotoContainer.h"

@implementation PhotoTableViewCell

#pragma mark - Properties
-(void) setNote:(ACCNote*) note{
    //guardamos la nota
    _note=note;
    //sincronizamos los datos de la nota con la vista
    self.photoView.image = note.photo.image;
    
}

#pragma mark - Class Methods


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
