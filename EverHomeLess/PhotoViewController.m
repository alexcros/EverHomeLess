//
//  PhotoViewController.m
//  EverHomeLess
//
//  Created by Alexandre Cros on 05/02/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import "PhotoViewController.h"
#import "ACCNote.h"
#import "ACCNotesViewController.h"
#import "ACCPhotoContainer.h"

@interface PhotoViewController ()
@property (strong, nonatomic) ACCNote *model;
@end

@implementation PhotoViewController

-(id)initWithModel:(ACCNote*) model {
    if (self = [super initWithNibName:nil bundle:nil])
    {
        _model = model;
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // Sincronizamos movelo y vista
    self.photoView.image = self.model.photo.image;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)deletePhoto:(id)sender {
}

- (IBAction)takePhoto:(id)sender {
}
@end