//
//  UIView+Animation.h
//  UIAnimationSamples
//
//  Created by Shailesh on 16/12/14.
//  Copyright (c) 2014 houzify. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Animation)
- (void) moveTo:(CGPoint)destination duration:(float)secs option:(UIViewAnimationOptions)option;

- (void) downUnder:(float)secs option:(UIViewAnimationOptions) option;

- (void) addSubviewWithZoomInAnimation:(UIView *)view
                              duration:(float)secs
                                option:(UIViewAnimationOptions)option;

- (void) addSubviewWithFadeAnimation:(UIView *)view
                            duration:(float)secs
                              option:(UIViewAnimationOptions)option;

- (void) addSubviewFromTopWithFadeAnimation:(UIView *)view
                                   duration:(float)secs
                                     option:(UIViewAnimationOptions)option;

- (void) addSubviewFromBottomWithFadeAnimation:(UIView *)view
                                      duration:(float)secs
                                        option:(UIViewAnimationOptions)option;

- (void) removeWithZoomOutAnimation:(float)secs
                             option:(UIViewAnimationOptions)option;

- (void) removeWithSinkAnimation:(int)steps;

- (void) removeWithSinkAnimationRotateTimer:(NSTimer*) timer;

- (void) removeSubviewFromTopWithFadeAnimation:(UIView *)view
                                      duration:(float)secs
                                        option:(UIViewAnimationOptions)option;

- (void) removeSubviewFromBottomWithFadeAnimation:(UIView *)view
                                         duration:(float)secs
                                           option:(UIViewAnimationOptions)option;
@end
