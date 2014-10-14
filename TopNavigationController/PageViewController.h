//
//  PageViewController.h
//  TopNavigationController
//
//  Created by Petar Gezenchov on 14/10/2014.
//  Copyright (c) 2014 Gezenchov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageViewController : UIViewController

@property NSUInteger pageIndex;
@property NSString *titleText;
@property (nonatomic, weak) IBOutlet UILabel *textLabel;
@property (nonatomic, strong) IBOutlet UIView *contentTableContainerView;

@end
