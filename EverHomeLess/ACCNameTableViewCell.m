//
//  ACCNameTableViewCell.m
//  EverHomeLess
//
//  Created by Alexandre Cros on 05/02/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import "ACCNameTableViewCell.h"
#import "ACCNote.h"

@interface ACCNameTableViewCell ()

@end

@implementation ACCNameTableViewCell

#pragma mark - properties
-(void) setNote:(ACCNote *)note{
    //sincronizamos la vista con la nota
    self.nameField.text = note.name;
    //guardamos la nota
    _note = note;
}

#pragma mark - Class Methods

+(CGFloat)height{
    
    return 44.0f;
}

+(NSString*)cellId{
    return [self description];
}

#pragma mark - KVO
// das de alta / luego date de baja
//-(void) setNote:(ACCNote *)note{
    // empiezo a observar algunas propiedades
    //cargamos los datos de la nota en la vista
    
//}
#pragma mark - misc
// vital para celdas personalizadas (dar de baja/ resetear la vista antes de que te metan datos nuevos) metodo que manda la tabla que saca del cache y va a reutilizar.
-(void) prepareForReuse{ //cache cuando la label desaparezca en pantalla
    [super prepareForReuse];
    // cuando desaparezco, me mandan este mensaje pa que me resetee y me prepare para ser reutilizado
    // algo asi como un viewWillDissapear
    
    
    // me doy de baja de las notificacones KVO
    
    //sincroniza la vista con la nota por si bubo cambos
    self.note.name = self.nameField.text;
}
/*
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
     cuando la celda es de escritura/lectura
    self.nameField.text = self.nameField.text;
}
*/
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
