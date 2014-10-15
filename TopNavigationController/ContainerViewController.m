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
#import "ContentViewController.h"

@interface ContainerViewController () <NavigationViewController, ContentViewController>

@property (nonatomic, strong) NavigationViewController *navigationController;
@property (nonatomic, strong) ContentViewController *contentViewController;

@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController = [NavigationViewController new];
    self.navigationController.delegate = self;
    
    NavigationItemViewController *item0 = [NavigationItemViewController new];
    item0.titleText = @"NEWS";
    item0.overlayColor = [UIColor colorWithRed:0 green:204.0f/255.0f blue:102.0f/255.0f alpha:0.5f];
    item0.solidColor = [UIColor colorWithRed:0 green:204.0f/255.0f blue:102.0f/255.0f alpha:1];
    NavigationItemViewController *item1 = [NavigationItemViewController new];
    item1.titleText = @"EVENTS";
    item1.overlayColor = [UIColor colorWithRed:1 green:165.0f/255.0f blue:0 alpha:0.5f];
    item1.solidColor = [UIColor colorWithRed:1 green:165.0f/255.0f blue:0 alpha:1];
    NavigationItemViewController *item2 = [NavigationItemViewController new];
    item2.titleText = @"ENTERTAINMENT";
    item2.overlayColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.5f];
    item2.solidColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:1];
    
    self.navigationController.navigationItems = [NSArray arrayWithObjects:item0, item1, item2, nil];
    
    [self.view addSubview:self.navigationController.view];
    
    self.contentViewController = [ContentViewController new];
    self.contentViewController.delegate = self;
    
    self.contentViewController.view.frame = CGRectMake(0, self.view.frame.size.height - self.contentViewController.view.frame.size.height, self.contentViewController.view.frame.size.width, self.contentViewController.view.frame.size.height);
    [self.view addSubview:self.contentViewController.view];
}

- (void)didSelectedItemAtIndex:(NSUInteger)index
{
    [self.contentViewController selectPageAtIndex:index];
}

- (void)didSelectedPageAtIndex:(NSUInteger)index
{
    [self.navigationController selectItemAtIndex:index];
}

@end
