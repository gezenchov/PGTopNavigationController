//
//  NavigationViewController.m
//  TopNavigationController
//
//  Created by Petar Gezenchov on 24/09/2014.
//  Copyright (c) 2014 Gezenchov. All rights reserved.
//

#import "NavigationViewController.h"
#import "NavigationItemViewController.h"

@interface NavigationViewController () <NavigationItem>

@property (nonatomic, weak) IBOutlet UIScrollView *navigationScrollView;

@end

@implementation NavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (NSUInteger i = 0 ; i < self.navigationItems.count; i++) {
        NavigationItemViewController *navItem = self.navigationItems[i];
        
        if (i == 0) {
            navItem.isFocused = YES;
            [self didSelectedItemAtIndex:i];
        }
        else {
            navItem.isFocused = NO;
        }
        
        navItem.delegate = self;
        navItem.button.tag = i;
        navItem.view.frame = CGRectMake(i * [self itemsWidth] + 5, 30, [self itemsWidth] - 10, 60);
        [self.navigationScrollView addSubview:navItem.view];
        self.navigationScrollView.contentSize = CGSizeMake(i * [self itemsWidth] + 5 + [self itemsWidth] - 10,  self.view.frame.size.height - 30);
    }
    
    self.navigationScrollView.contentOffset = CGPointMake(-50, 0);
    
    self.navigationScrollView.contentInset = UIEdgeInsetsMake(0, 50, 0, 50);
    
    ((NavigationItemViewController*)self.navigationItems[0]).isFocused = YES;

    // Do any additional setup after loading the view.
}

- (void)didSelectedItemAtIndex:(NSUInteger)index
{
    NavigationItemViewController *navItem = self.navigationItems[index];
    [self.navigationScrollView scrollRectToVisible:navItem.view.frame animated:YES];
    self.view.backgroundColor = navItem.overlayColor;
    
    [self.delegate didSelectedItemAtIndex:index];
}

- (CGFloat)itemsWidth
{
    CGFloat width = 0.0f;
    CGFloat containerWidth = self.view.frame.size.width;
    
    width = containerWidth / self.navigationItems.count + 100.0f;
    
    return width;
}

- (CGRect)frameForItemAtIndex:(NSUInteger)index
{
    if (index < [self focusedItemIndex]) {
        //return [self fra];
    }
    else if (index > [self focusedItemIndex]) {
        return CGRectZero;
    }
//else {
        return [self frameForItemAtIndex:index];
    //}
}

//- (CGRect)frameForItemBeforeFocusedAtIndex:(NSUInteger)index
//{
//    
//}
//
//- (CGRect)frameForItemAfterFocusedAtIndex:(NSUInteger)index
//{
//    
//}

- (CGRect)frameForFocusedItemAtIndex:(NSUInteger)index
{
    CGRect frame = [self linearFrameForItemAtIndex:0];
    // First item
    if (index == 0) {
        return frame;
    }
    else if (index == self.navigationItems.count - 1) {
        CGFloat leftOffset = frame.origin.x;
        return CGRectMake(self.view.frame.size.width - frame.size.width - leftOffset, frame.origin.y, frame.size.width, frame.size.height);
        
    }
    else {
        return CGRectMake((self.view.frame.size.width - frame.size.width) / 2, frame.origin.y, frame.size.width, frame.size.height);
    }
}

- (CGRect)linearFrameForItemAtIndex:(NSUInteger)index
{
    return CGRectMake(index * [self itemsWidth] + 5, 30, [self itemsWidth] - 10, self.view.frame.size.height - 30);
}

- (BOOL)isFocusedIndex:(NSUInteger)index
{
    NavigationItemViewController *navItem = self.navigationItems[index];
    
    return navItem.isFocused;
}

- (NSUInteger)focusedItemIndex
{
    NSUInteger focusedIndex = 0;
    
    for (NSUInteger i = 0 ; i < self.navigationItems.count; i++) {
        NavigationItemViewController *navItem = self.navigationItems[i];
        if (navItem.isFocused) {
            focusedIndex = i;
            break;
        }
    }
    
    return focusedIndex;
}

@end
