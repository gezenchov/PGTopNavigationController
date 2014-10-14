//
//  ContainerViewController.m
//  TopNavigationController
//
//  Created by Petar Gezenchov on 24/09/2014.
//  Copyright (c) 2014 Gezenchov. All rights reserved.
//

#import "ContainerViewController.h"
#import "NavigationViewController.h"
#import "NavigationItemViewController.h"

@interface ContainerViewController ()

@property (nonatomic, strong) NavigationViewController *navigationController;

@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController = [NavigationViewController new];
    
    NavigationItemViewController *item0 = [NavigationItemViewController new];
    item0.titleText = @"First";
    NavigationItemViewController *item1 = [NavigationItemViewController new];
    item1.titleText = @"Second";
    NavigationItemViewController *item2 = [NavigationItemViewController new];
    item2.titleText = @"Third";
    
    self.navigationController.navigationItems = [NSArray arrayWithObjects:item0, item1, item2, nil];
    
    [self.view addSubview:self.navigationController.view];
}

@end
