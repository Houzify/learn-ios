//
//  AnimationCurvePicker.h
//  UIAnimationSamples
//
//  Created by Shailesh on 16/12/14.
//  Copyright (c) 2014 houzify. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationCurvePicker : UIView
@property (nonatomic, weak) IBOutlet UITableView *curveList;

+ (id) newAnimationCurvePicker:(id)pickDelegate;
@end
