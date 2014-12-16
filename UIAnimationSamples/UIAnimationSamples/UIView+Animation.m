//
//  UIView+Animation.m
//  UIAnimationSamples
//
//  Created by Shailesh on 16/12/14.
//  Copyright (c) 2014 houzify. All rights reserved.
//

#import "UIView+Animation.h"

@implementation UIView (Animation)

- (void) moveTo:(CGPoint)destination duration:(float)secs option:(UIViewAnimationOptions)option {
    [UIView animateWithDuration:secs
                          delay:0.0
                        options:option
                     animations:^{
                         self.frame = CGRectMake(destination.x, destination.y,
                                                 self.frame.size.width, self.frame.size.height);
        
                     }
                     completion:nil];
}

- (void) downUnder:(float)secs option:(UIViewAnimationOptions)option {
    [UIView animateWithDuration:secs
                          delay:0.0
                        options:0
                     animations:^{
                         self.transform = CGAffineTransformRotate(self.transform, M_PI);
                     }
                     completion:nil];
}

- (void) addSubviewWithZoomInAnimation:(UIView *)view
                              duration:(float)secs
                                option:(UIViewAnimationOptions)option {
    // Scale down the subview to 1/100th of its size without animation
    view.alpha = 0.1;
    view.transform = CGAffineTransformScale(view.transform, 0.01, 0.01);
    [self addSubview:view];
    
    // Restore the size, animating over the duration
    [UIView animateWithDuration:secs
                          delay:0.0
                        options:option
                     animations:^{
                         view.alpha = 1.0;
                         view.transform = CGAffineTransformScale(view.transform, 100.0, 100.0);
                     }
                     completion:nil];
}

- (void) removeWithZoomOutAnimation:(float)secs
                             option:(UIViewAnimationOptions)option {
    [UIView animateWithDuration:secs
                          delay:0.0
                        options:option
                     animations:^{
                         self.alpha = 0.1;
                         self.transform = CGAffineTransformScale(self.transform, 0.01, 0.01);
                     }
                     completion:^(BOOL finished) {
                         [self removeFromSuperview];
                     }];
}

@end
