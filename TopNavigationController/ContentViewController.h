//
//  ContentViewController.h
//  TopNavigationController
//
//  Created by Petar Gezenchov on 14/10/2014.
//  Copyright (c) 2014 Gezenchov. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ContentViewController <NSObject>

- (void)didSelectedPageAtIndex:(NSUInteger)index;

@end

@interface ContentViewController : UIViewController <UIPageViewControllerDataSource>

@property (nonatomic) id<ContentViewController> delegate;
@property (nonatomic, weak) IBOutlet UIScrollView *contentScrollView;

- (void)selectPageAtIndex:(NSUInteger)index;

@end
