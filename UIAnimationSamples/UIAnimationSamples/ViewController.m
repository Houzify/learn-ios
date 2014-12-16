//
//  ViewController.m
//  UIAnimationSamples
//
//  Created by Shailesh on 16/12/14.
//  Copyright (c) 2014 houzify. All rights reserved.
//

#import "ViewController.h"
#import "AnimationCurvePicker.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize movingButton;

static int curveValues[] = {
    UIViewAnimationOptionCurveEaseInOut,
    UIViewAnimationOptionCurveEaseIn,
    UIViewAnimationOptionCurveEaseOut,
    UIViewAnimationOptionCurveLinear
};


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    curveList = [[NSMutableArray alloc] initWithObjects:@"EaseInOut", @"EaseIn", @"EaseOut", @"Linear", nil];
    selectedCurveIndex = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - animation
- (IBAction) btnMoveTo:(id)sender {
    UIButton *button = (UIButton *)sender;
    [movingButton moveTo:
     CGPointMake(button.center.x - movingButton.frame.size.width/2,
                 button.center.y - (movingButton.frame.size.height + 10.0))
                duration:1.0
                  option:curveValues[selectedCurveIndex]];
}

- (IBAction) btnDownUnder:(id)sender {
    UIButton *button = (UIButton *)sender;
    [button downUnder:1.0 option:curveValues[selectedCurveIndex]];
}

- (IBAction) btnZoom:(id)sender {
    UIButton *button = (UIButton *)sender;
    pickerView = [AnimationCurvePicker newAnimationCurvePicker:self];
    pickerView.center = button.center;
    [self.view addSubviewWithZoomInAnimation:pickerView duration:1.0
                                      option:curveValues[selectedCurveIndex]];
    
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [curveList count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"CellID"];
    }
    
    cell.textLabel.text = [curveList objectAtIndex:indexPath.row];
    if (indexPath.row == selectedCurveIndex) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Select the Animation Curve to use";
}

- (NSString *) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return @"Curves will not affect total duration, but instant speed and acceleration.";
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    if (selectedCurveIndex != indexPath.row) {
        NSIndexPath *oldPath = [NSIndexPath indexPathForRow:selectedCurveIndex inSection:indexPath.section];
        cell = [tableView cellForRowAtIndexPath:oldPath];
        cell.accessoryType = UITableViewCellAccessoryNone;
        selectedCurveIndex = (int)indexPath.row;
    }
    
    if (pickerView) {
        [pickerView removeWithZoomOutAnimation:1.0 option:curveValues[selectedCurveIndex]];
        pickerView = nil;
    }
}
@end
