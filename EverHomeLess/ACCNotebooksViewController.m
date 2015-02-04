//
//  ACCNotebooksViewController.m
//  EverHomeLess
//
//  Created by Alexandre Cros on 04/02/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import "ACCNotebooksViewController.h"
#import "ACCNotebook.h"
#import "ACCNote.h"
#import "ACCNotesViewController.h"


//#import "AGTCoreDataTableViewController.h"

@interface ACCNotebooksViewController ()

@end

@implementation ACCNotebooksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"EverHomeLess";
    // add button new notebook
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNotebook:)];
    
    self.navigationItem.rightBarButtonItem = addBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    // Averiguamos de que linrea me hablan, importamos aCCNotebook
    ACCNotebook *nb = [self.fetchedResultsController
                       objectAtIndexPath:indexPath];
    // creo una celda
    static NSString *CellId = @"NoteBookId";
    //UITableViewCell *cell = [tableView dequeueRe

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    
    if(cell == nil){
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellId];
    }
    
    
    
    // la configuro (syncro model > view)
    cell.textLabel.text = nb.name;
    
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateFormatterShortStyle;
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ (%lu notes)",
                                 [fmt stringFromDate:nb.modificationDate],(unsigned long)nb.notes.count];
    
    // la devuelvo
    return cell;
}
// borrar
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *) indexPath{
    
    // averiguar si el pollo quiere eliminar
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        //Borramos la libreta/ cuala es?
        NSManagedObjectContext *ctx = self.fetchedResultsController.managedObjectContext;
        
        ACCNotebook *difunto = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        [ctx deleteObject:difunto];
    }
}

-(NSString*)tableView:(UITableView *)tableView
titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return @"Remove";
}

#pragma mark - Delegate

-(void)tableView:(UITableView*) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // averiguar libreta
    ACCNotebook *nb = [self.fetchedResultsController objectAtIndexPath:indexPath];
    // creo instancia
    NSFetchRequest *r =[NSFetchRequest fetchRequestWithEntityName:[ACCNote entityName]];
    r.fetchBatchSize = 30;
   // r = [NSFetchRequest fetchRequestWithEntityName:[ACCNote entityName]];
    
    r.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:ACCNoteAttributes.name
                                                        ascending:YES
                                                         selector:@selector(caseInsensitiveCompare:)],
                          [NSSortDescriptor sortDescriptorWithKey:ACCNoteAttributes.modificationDate
                                                        ascending:NO]];
    // predicado
    r.predicate = [NSPredicate predicateWithFormat:@"notebook == %@",nb];
    
    NSFetchedResultsController *fc = [[NSFetchedResultsController alloc]initWithFetchRequest:r managedObjectContext:self.fetchedResultsController.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
  
    // creo una instanca de contr de notas
    ACCNotesViewController *nVC = [[ACCNotesViewController alloc]initWithFetchedResultsController:fc style:UITableViewStylePlain];
    
    nVC.notebook = nb;
    
    // lo pusheo
    [self.navigationController pushViewController:nVC
                                         animated:YES];
    
}

#pragma mark - Actions

-(void)addNotebook:(id)sender{
                                   
[ACCNotebook notebookWithName:@"Nueva Libreta"
                      context:self.fetchedResultsController.managedObjectContext];
}



@end
