//
//  FakeHUD.m
//  UIAnimationSamples
//
//  Created by Shailesh on 16/12/14.
//  Copyright (c) 2014 houzify. All rights reserved.
//

#import "FakeHUD.h"

@implementation FakeHUD

+ (id) newFakeHUD {
    UINib *nib = [UINib nibWithNibName:@"FakeHUD" bundle:nil];
    NSArray *array = [nib instantiateWithOwner:self options:nil];
    FakeHUD *me = [array objectAtIndex:0];
    return me;
}

- (IBAction)btnStop:(id)sender {
    [self removeWithSinkAnimation:40];
}

- (IBAction)btnFadeIn:(id)sender {
    [self addSubviewFromTopWithFadeAnimation:_headerView duration:0.486
                                      option:UIViewAnimationOptionCurveEaseOut];
    [self addSubviewFromBottomWithFadeAnimation:_footerView duration:0.486
                                         option:UIViewAnimationOptionCurveEaseOut];
}

- (IBAction)btnFadeOut:(id)sender {
    [self removeSubviewFromBottomWithFadeAnimation:_footerView duration:0.379 option:UIViewAnimationOptionCurveEaseIn];
    [self removeSubviewFromTopWithFadeAnimation:_headerView duration:0.379 option:UIViewAnimationOptionCurveEaseIn];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
