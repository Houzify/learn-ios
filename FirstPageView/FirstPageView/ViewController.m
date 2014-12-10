//
//  ViewController.m
//  FirstPageView
//
//  Created by Shailesh on 10/12/14.
//  Copyright (c) 2014 houzify. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _pageTitles = @[@"Over 200 Tips and Tricks", @"Discover Hidden Features",
                    @"Bookmark Favorite Tip", @"Free Regular Update"];
    _pageImages = @[@"page1.png", @"page2.png", @"page3.png", @"page4.png"];
    
    // Create the page view controller
    self.pageViewController = [self.storyboard
                               instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    self.pageViewController.delegate = self;
    
    PageContentController *starting = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[starting];
    [self.pageViewController setViewControllers:viewControllers
                            direction:UIPageViewControllerNavigationDirectionForward
                            animated:NO
                            completion:nil];
    
    // Change the size of the page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0,
                                                    self.view.frame.size.width,
                                                    self.view.frame.size.height - 30);
    
    // Notify that child view will be added, do the add, then notify its done
    //[self.pageViewController willMoveToParentViewController:self];
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - PageViewControllerDataSource
/**
 * Return the View controller before the current page
 */
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
       viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = ((PageContentController *)viewController).pageIndex;
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    NSLog(@"Cached views back to index %lu", (unsigned long)index);
    return [self viewControllerAtIndex:index];
}

/**
 * Return the View controller after the current page
 */
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
        viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = ((PageContentController *)viewController).pageIndex;
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageTitles count]) {
        return nil;
    }
    NSLog(@"Cached views upto index %lu", (unsigned long)index);
    return [self viewControllerAtIndex:index];
}

/**
 * Return the View controller for a specific index
 */
- (PageContentController *)viewControllerAtIndex:(NSUInteger)index {
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    
    PageContentController *pageContentController = [self.storyboard
                                                    instantiateViewControllerWithIdentifier:@"PageContentController"];
    pageContentController.imageFile = self.pageImages[index];
    pageContentController.titleText = self.pageTitles[index];
    pageContentController.pageIndex = index;
    
    return pageContentController;
}

- (void)pageViewController:(UIPageViewController *)pageViewController
        didFinishAnimating:(BOOL)finished
        previousViewControllers:(NSArray *)previousViewControllers
        transitionCompleted:(BOOL)completed {
    
    NSLog(@"PageViewController didFinishAnimating:%s previousViewControllers count:%lu transitionCompleted:%s",
          (finished ? "YES":"NO"), (unsigned long)[previousViewControllers count], (completed ? "YES":"NO"));
    
    if (completed == TRUE && [previousViewControllers count] > 0) {
        PageContentController *prevPage = [previousViewControllers objectAtIndex:0];
        PageContentController *currPage = [[pageViewController viewControllers] objectAtIndex:0];
        
        NSLog(@	"Transition from %lu -> %lu", (unsigned long)prevPage.pageIndex, (unsigned long)currPage.pageIndex);
    }
}

@end
