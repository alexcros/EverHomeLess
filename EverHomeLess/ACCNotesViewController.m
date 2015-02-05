//
//  ACCNotesViewController.m
//  EverHomeLess
//
//  Created by Alexandre Cros on 04/02/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import "ACCNotesViewController.h"
#import "ACCNote.h"
#import "ACCNotebookTableViewCell.h"

#import "ACCPhotoContainer.h"

@interface ACCNotesViewController ()

@end

@implementation ACCNotesViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:NO];
    // Do any additional setup after loading the view.
    self.title = self.notebook.name;
    
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNote:)];
    
    self.navigationItem.rightBarButtonItem = addBtn;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



// borrar notas
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *) indexPath{
    
    // averiguar si el pollo quiere eliminar
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        //Borramos la nota/ cuala es?
        NSManagedObjectContext *ctx = self.fetchedResultsController.managedObjectContext;
        
        ACCNote *difunto = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        [ctx deleteObject:difunto];
    }
}

-(NSString*)tableView:(UITableView *)tableView
titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return @"Remove";
}

// crea nota
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // averiguar la nota
    ACCNote *n = [self.fetchedResultsController objectAtIndexPath:indexPath];
    // creamos la celda
    static NSString *cellId = @"noteCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    // la devolvemos
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    //la configuramos
    cell.imageView.image = n.photo.image;
    cell.textLabel.text = n.name;
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateIntervalFormatterMediumStyle;
    cell.detailTextLabel.text = [fmt stringFromDate:n.modificationDate];

    return cell;

}
#pragma mark - Actions

-(void)addNote:(id) sender{
    
    [ACCNote noteWithName:@"Nueva nota"
                 notebook:self.notebook
                  context:self.notebook.managedObjectContext];
}












@end
