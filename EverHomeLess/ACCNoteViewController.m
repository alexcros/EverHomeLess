//
//  ACCNoteViewController.m
//  EverHomeLess
//
//  Created by Alexandre Cros on 10/02/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//
// Constantes
#define NUMBER_OF_SECTIONS 4
#define NAME_SECTION_HEADER @"Name"
#define DATES_SECTION_HEADER @"Created and last modified"
#define TEXT_SECTION_HEADER @"Text"
#define PHOTO_SECTION_HEADER @"Photo"
#define NAME_SECTION    0
#define DATES_SECTION   1
#define TEXT_SECTION    2
#define PHOTO_SECTION   3

#import "ACCNoteViewController.h"
#import "ACCNote.h"
#import "ACCNameTableViewCell.h"
#import "ACCTextTableViewCell.h"
#import "ACCDatesTableViewCell.h"
#import "PhotoViewController.h"
#import "ACCPhotoTableViewCell.h"

@interface ACCNoteViewController ()

@end

@implementation ACCNoteViewController
-(id) initWithModel:(ACCNote*) model{
    
    if(self = [super initWithNibName:nil bundle:nil]){
        
        _note = model;
    }
    
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // registrar las celdas
    [self registerNibs];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return NUMBER_OF_SECTIONS;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}

-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    switch (section) {
        case NAME_SECTION:
            return NAME_SECTION_HEADER;
            break;
            
        case DATES_SECTION:
            return DATES_SECTION_HEADER;
            break;
            
        case TEXT_SECTION:
            return TEXT_SECTION_HEADER;
            break;
            
        case PHOTO_SECTION:
            return PHOTO_SECTION_HEADER;
            break;
            
        default:
            [NSException raise:@"Section no existe" format:nil];
            return @"esto no existe";
            break;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    // Averiguamos de qué celda nos habla
    switch (indexPath.section) {
        case NAME_SECTION:{
            
            ACCNameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[ACCNameTableViewCell cellId] forIndexPath:indexPath];
            
            [cell setNote:self.note];
            return cell;
            break;}
            
        case DATES_SECTION:{
            
            ACCDatesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[ACCDatesTableViewCell cellId] forIndexPath:indexPath];
            [cell setNote:self.note];
            return cell;
            break;}
            
        case TEXT_SECTION:{
            
            ACCTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[ACCTextTableViewCell cellId] forIndexPath:indexPath];
            [cell setNote:self.note];
            return cell;
            break;}
            
        case PHOTO_SECTION:{
            
            ACCPhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[ACCPhotoTableViewCell cellId] forIndexPath:indexPath];
            [cell setNote:self.note];
            return cell;
            break;}
            
        default:
            [NSException raise:@"UnkownSection"
                        format:@"Unknown section %ld",(long)indexPath.section];
            return nil;
            break;
    }
}


-(CGFloat) tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case NAME_SECTION:
            return [ACCNameTableViewCell height];
            break;
            
            
        case DATES_SECTION:
            return [ACCDatesTableViewCell height];
            break;
            
        case TEXT_SECTION:
            return [ACCTextTableViewCell height];
            break;
            
        case PHOTO_SECTION:
            return [ACCPhotoTableViewCell height];
            break;
            
        default:
            return 0;
            break;
    }
}


-(void) registerNibs{
    
    NSBundle *main = [NSBundle mainBundle];
    
    UINib *nameNib = [UINib nibWithNibName:@"ACCNameTableViewCell"
                                    bundle:main];
    [self.tableView registerNib:nameNib forCellReuseIdentifier:[ACCNameTableViewCell cellId]];
    
    
    UINib *datesNib = [UINib nibWithNibName:@"ACCDatesTableViewCell" bundle:main];
    [self.tableView registerNib:datesNib forCellReuseIdentifier:[ACCDatesTableViewCell  cellId]];
    
    UINib *textNib = [UINib nibWithNibName:@"ACCTextTableViewCell" bundle:main];
    
    [self.tableView registerNib:textNib forCellReuseIdentifier:[ACCTextTableViewCell cellId]];
    
    UINib *photoNib = [UINib nibWithNibName:@"ACCPhotoTableViewCell" bundle:main];
    [self.tableView registerNib:photoNib forCellReuseIdentifier:[ACCPhotoTableViewCell cellId]];
    
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == PHOTO_SECTION) {
        
        
        // Mostramos el controlador de Fotos
        PhotoViewController *pVC = [[PhotoViewController alloc] initWithModel:self.note];
        
        [self.navigationController pushViewController:pVC
                                             animated:YES];
        
    }
}


@end
