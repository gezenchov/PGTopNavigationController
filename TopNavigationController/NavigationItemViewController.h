//
//  NavigationItemViewController.h
//  TopNavigationController
//
//  Created by Petar Gezenchov on 24/09/2014.
//  Copyright (c) 2014 Gezenchov. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NavigationItem <NSObject>

- (void)didSelectedItemAtIndex:(NSUInteger)index;

@end

@interface NavigationItemViewController : UIViewController

@property (nonatomic, strong) NSString *titleText;
@property (nonatomic, strong) UIColor *overlayColor;
@property (nonatomic, strong) UIColor *solidColor;
@property (nonatomic) BOOL isFocused;
@property (nonatomic) id<NavigationItem> delegate;

@property (nonatomic, weak) IBOutlet UIButton *button;

@end
