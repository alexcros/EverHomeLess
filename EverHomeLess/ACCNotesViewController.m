//
//  ACCNotesViewController.m
//  EverHomeLess
//
//  Created by Alexandre Cros on 04/02/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import "ACCNotesViewController.h"
#import "ACCNote.h"
#import "ACCPhotoContainer.h"
#import "ACCNoteViewController.h"
#import "ACCPhotoContainer.h"

@implementation ACCNotesViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Agregamos botón de añadir notas
    UIBarButtonItem *b = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNote:)];
    
    self.navigationItem.rightBarButtonItem = b;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.title = self.notebook.name;
    
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Averiguar la nota
    ACCNote *n = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Creamos la celda
    static NSString *cellId = @"noteCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    // La configuramos
    cell.imageView.image = n.photo.image;
    cell.textLabel.text = n.name;
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateIntervalFormatterMediumStyle;
    cell.detailTextLabel.text = [fmt stringFromDate:n.modificationDate];
    
    // La devolvemos
    return cell;
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Averiguamos la celda
        ACCNote *difunto = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        // La eliminamos
        NSManagedObjectContext *ctxt = self.notebook.managedObjectContext;
        
        [ctxt deleteObject:difunto];
    }
    
}

- (NSString *) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"Remove";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

-(void) addNote:(id)sender {
    
    [ACCNote noteWithName:@"Nueva nota" notebook:self.notebook context:self.notebook.managedObjectContext];
    
}

#pragma mark - Delegate

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Averiguar la nota
    ACCNote *note = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Crear formulario de nota
    ACCNoteViewController *nVC = [[ACCNoteViewController alloc]initWithModel:note];
    
    // Hacer el push
    [self.navigationController pushViewController:nVC animated:YES];
    
}

@end
