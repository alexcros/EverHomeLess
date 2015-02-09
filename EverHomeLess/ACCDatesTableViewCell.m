//
//  ACCDatesTableViewCell.m
//  EverHomeLess
//
//  Created by Alexandre Cros on 09/02/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import "ACCDatesTableViewCell.h"
#import "ACCNote.h"

@implementation ACCDatesTableViewCell

+(CGFloat)height{
    
    return 44.0f;
}

+(NSString*)cellId{
    return [self description];
}


-(void)setNote:(ACCNote*)note{
    
    //guardar la nota
    _note = note;
    //observamos las propiedades de la nota
    //y actualizamos la modificationDate
    [self.note addObserver:self
                forKeyPath:ACCNoteAttributes.modificationDate
                   options:0
                   context:NULL]; //puntero
}

-(void)prepareForReuse{
    [super prepareForReuse];
    // hay que darse de baja de las notificaciones de KVO
    [self.note removeObserver:self
                   forKeyPath:ACCNoteAttributes.modificationDate];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    [self syncNoteWithView];
}

-(void)syncNoteWithView{
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateFormatterShortStyle;
    self.creationLabel.text = [fmt stringFromDate:self.note.creationDate];
    
    fmt.dateStyle = NSDateIntervalFormatterFullStyle;
    self.modificationLabel.text = [fmt stringFromDate:self.note.modificationDate];
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    
    // Configure the view for the selected state
}

@end

