//
//  UIViewController+Navigation.m
//  EverHomeLess
//
//  Created by Alexandre Cros on 04/02/15.
//  Copyright (c) 2015 Alex Cros. All rights reserved.
//

#import "UIViewController+Navigation.h"

@implementation UIViewController (Navigation)

-(UINavigationController *) accWrappedInNavigation{
 
    UINavigationController *nav = [UINavigationController new];
    [nav pushViewController:self
                             animated:NO];
    
    return nav;
}

@end
