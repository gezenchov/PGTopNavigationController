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
    item0.titleText = @"NEWS";
    item0.overlayColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.5f];
    item0.solidColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
    NavigationItemViewController *item1 = [NavigationItemViewController new];
    item1.titleText = @"EVENTS";
    item1.overlayColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:0.5f];
    item1.solidColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
    NavigationItemViewController *item2 = [NavigationItemViewController new];
    item2.titleText = @"ENTERTAINMENT";
    item2.overlayColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.5f];
    item2.solidColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:1];
    
    self.navigationController.navigationItems = [NSArray arrayWithObjects:item0, item1, item2, nil];
    
    [self.view addSubview:self.navigationController.view];
}

@end
