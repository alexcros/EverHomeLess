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

@interface ACCNotesViewController ()

@end

@implementation ACCNotesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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

@end
