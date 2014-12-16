//
//  FakeHUD.h
//  UIAnimationSamples
//
//  Created by Shailesh on 16/12/14.
//  Copyright (c) 2014 houzify. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Animation.h"

@interface FakeHUD : UIView
+ (id) newFakeHUD;

@property IBOutlet UIView *headerView;
@property IBOutlet UIView *footerView;

- (IBAction)btnStop:(id)sender;
- (IBAction)btnFadeIn:(id)sender;
- (IBAction)btnFadeOut:(id)sender;

@end
