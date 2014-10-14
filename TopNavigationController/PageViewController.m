//
//  PageViewController.m
//  TopNavigationController
//
//  Created by Petar Gezenchov on 14/10/2014.
//  Copyright (c) 2014 Gezenchov. All rights reserved.
//

#import "PageViewController.h"
#import "PageTableViewController.h"

@interface PageViewController ()

@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.textLabel.text = self.titleText;
    
    PageTableViewController *tableView = [PageTableViewController new];
    [self.contentTableContainerView addSubview:tableView.view];
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

@end
