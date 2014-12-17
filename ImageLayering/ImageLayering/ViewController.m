//
//  ViewController.m
//  ImageLayering
//
//  Created by Shailesh on 17/12/14.
//  Copyright (c) 2014 houzify. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self addGradientToView:_imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) addGradientToView:(UIView *)view {
    CAGradientLayer *gradient  = [CAGradientLayer layer];
    gradient.frame = view.bounds;
    gradient.locations = @[@0.0, @0.15, @0.85, @1.0];
    gradient.colors = @[(id)[[UIColor colorWithWhite:0.0 alpha:0.8] CGColor],
                        (id)[[UIColor clearColor] CGColor],
                        (id)[[UIColor clearColor] CGColor],
                        (id)[[UIColor colorWithWhite:0.0 alpha:0.8] CGColor]];
    [view.layer insertSublayer:gradient atIndex:0];
}

@end
