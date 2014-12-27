//
//  ViewController.m
//  ButtonAnimate
//
//  Created by Shailesh on 27/12/14.
//  Copyright (c) 2014 houzify. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClicked:(id)sender {
    [_button setImage:[UIImage imageNamed:@"addtostylebook_icon.png"] forState:UIControlStateNormal];

    CABasicAnimation *preReplace = [ViewController spinAnimateFromRev:0 byRevs:0.75 duration:0.5];
    CABasicAnimation *postReplace = [ViewController spinAnimateFromRev:0.75 byRevs:0.25 duration:0.5];
    
    // This is a little backwards: setting the completion block of the animation
    // before starting the animation.
    [CATransaction setCompletionBlock:^{
        [_button.layer setValue:@(M_PI*2*0.75) forKeyPath:@"tranform.rotation.x"];
        [_button setImage:[UIImage imageNamed:@"bookmarkednew.png"] forState:UIControlStateNormal];
        [_button.layer addAnimation:postReplace forKey:@"postReplace"];
    }];
    // Add animation to the layer and make it so
    [_button.layer addAnimation:preReplace forKey:@"preReplace"];
    [CATransaction commit];
}

- (void)unclick {
    
}

+ (CABasicAnimation *)spinAnimateFromRev:(float)fromRevs byRevs:(float)byRevs duration:(CFTimeInterval)inDuration {
    
    // Rotate about the x axis
    CABasicAnimation* rotationAnimation =
        [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    
    // Rotate by number of revolutions, in direction specified
    rotationAnimation.additive = YES;
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI*2*(fromRevs+byRevs)];
    rotationAnimation.byValue = [NSNumber numberWithFloat:M_PI*2*byRevs];
    
    // Perform the rotation over this many seconds
    rotationAnimation.duration = inDuration;
    
    // Set the pacing of the animation
    rotationAnimation.timingFunction =
    [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    return rotationAnimation;
}

- (CABasicAnimation *)crossfadeImage {
    UIImage *fromImage = [UIImage imageNamed:@"addtostylebook_icon.png"];
    UIImage *toImage = [UIImage imageNamed:@"bookmarkednew.png"];

    CABasicAnimation* crossfadeAnimation = [CABasicAnimation animationWithKeyPath:@"contents"];
    
    crossfadeAnimation.fromValue = (id)(fromImage.CGImage);
    crossfadeAnimation.toValue = (id)(toImage.CGImage);
    crossfadeAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    crossfadeAnimation.duration = 1;
    crossfadeAnimation.removedOnCompletion = NO;
    crossfadeAnimation.fillMode = kCAFillModeForwards;
    return crossfadeAnimation;
}

@end