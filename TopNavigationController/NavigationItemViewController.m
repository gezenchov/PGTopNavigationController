//
//  NavigationItemViewController.m
//  TopNavigationController
//
//  Created by Petar Gezenchov on 24/09/2014.
//  Copyright (c) 2014 Gezenchov. All rights reserved.
//

#import "NavigationItemViewController.h"
#import "TopNavigationItem.h"

@interface NavigationItemViewController ()

@property (nonatomic, strong) TopNavigationItem *topNavigationItem;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;

@end

@implementation NavigationItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.titleLabel.text = self.titleText;
}

- (void)setIsFocused:(BOOL)isFocused
{
    _isFocused = isFocused;
    
    if (isFocused) {
        self.view.backgroundColor = [UIColor greenColor];
    }
    else {
        self.view.backgroundColor = [UIColor lightGrayColor];
    }
}

@end
