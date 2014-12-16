//
//  ViewController.h
//  UIAnimationSamples
//
//  Created by Shailesh on 16/12/14.
//  Copyright (c) 2014 houzify. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Animation.h"

@interface ViewController : UIViewController {
    NSMutableArray *curveList;
    int selectedCurveIndex;
    UIView *pickerView;
}

@property (nonatomic, weak) IBOutlet UIButton *movingButton;

- (IBAction) btnMoveTo:(id)sender;
- (IBAction) btnDownUnder:(id)sender;
- (IBAction) btnZoom:(id)sender;

@end

