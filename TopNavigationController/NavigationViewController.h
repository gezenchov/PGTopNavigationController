//
//  NavigationViewController.h
//  TopNavigationController
//
//  Created by Petar Gezenchov on 24/09/2014.
//  Copyright (c) 2014 Gezenchov. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NavigationViewController <NSObject>

- (void)didSelectedItemAtIndex:(NSUInteger)index;

@end


@interface NavigationViewController : UIViewController

@property (nonatomic) id<NavigationViewController> delegate;
@property (nonatomic, strong) NSArray *navigationItems;

@end
