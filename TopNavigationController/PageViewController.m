//
//  PageViewController.m
//  TopNavigationController
//
//  Created by Petar Gezenchov on 14/10/2014.
//  Copyright (c) 2014 Gezenchov. All rights reserved.
//

#import "PageViewController.h"

@interface PageViewController ()
{
    CGFloat _lastOffset;
}

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;

@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.textLabel.text = self.titleText;
    
    self.tableView.backgroundColor = [UIColor clearColor];
//    self.view.backgroundColor = [UIColor yellowColor];
//    self.contentTableContainerView.backgroundColor = [UIColor redColor];
    
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.tableView.bounds.size.width, 0.01f)];
    
                    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width, self.scrollView.frame.size.height + 30);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 9;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 40.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 180;
    }
    else {
        return 50;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    
    if (indexPath.row == 0) {
        cell.backgroundColor = [UIColor grayColor];
    }
    else {
        cell.backgroundColor = [UIColor lightGrayColor];
    }

    return cell;
}

- (BOOL)touchesShouldBegin:(NSSet *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view
{
    return YES;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (scrollView.tag == 1) {
        CGFloat offset = scrollView.contentOffset.y;
        NSLog(@"offset:%f", offset);

        if (offset == 0) {
            CGPoint translation = [scrollView.panGestureRecognizer translationInView:scrollView.superview];
            
            if(translation.y > 0)
            {
                // react to dragging down
//                self.tableView.userInteractionEnabled = YES;

            } else
            {
                // react to dragging up
//                self.tableView.userInteractionEnabled = NO;
//                self.tableView.scrollEnabled = NO;

            }
        }
        else {

        }
    }

}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.tag == 1) {
        CGFloat offset = scrollView.contentOffset.y;
        NSLog(@"offset:%f", offset);
        
        CGRect frame = self.contentTableContainerView.frame;
        
        if (offset < 0) {
            self.tableView.userInteractionEnabled = YES;
            frame.origin.y = MIN(35 + (-0.5) * offset, 51.0f);
            
//            if (self.view.frame.origin.y < 0) {
//                CGRect tableFrame = self.view.frame;
//                
//                tableFrame.origin.y -= offset;
//                self.view.frame = tableFrame;
//                
//                
//                self.tableView.contentOffset = CGPointMake(0, 0);
//            }
        }
        else {
//            frame.origin.y = 35.0f;
//            CGRect tableFrame = self.view.frame;
//            
//            tableFrame.origin.y -= offset;
//            self.view.frame = tableFrame;
//            
//            self.tableView.contentOffset = CGPointMake(0, 0);
            
            
        }
        
        self.contentTableContainerView.frame = frame;
    }
}

@end
