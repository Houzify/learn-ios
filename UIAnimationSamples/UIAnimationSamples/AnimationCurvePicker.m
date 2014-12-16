//
//  AnimationCurvePicker.m
//  UIAnimationSamples
//
//  Created by Shailesh on 16/12/14.
//  Copyright (c) 2014 houzify. All rights reserved.
//

#import "AnimationCurvePicker.h"

@implementation AnimationCurvePicker
@synthesize curveList;

+ (id) newAnimationCurvePicker:(id)pickDelegate {
    UINib *nib = [UINib nibWithNibName:@"AnimationCurvePicker" bundle:nil];
    NSArray *nibArray = [nib instantiateWithOwner:self options:nil];
    AnimationCurvePicker *cp = [nibArray objectAtIndex:0];
    cp.curveList.delegate = pickDelegate;
    cp.curveList.dataSource = pickDelegate;
    return cp;
}

@end
