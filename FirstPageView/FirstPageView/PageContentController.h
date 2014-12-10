//
//  PageContentController.h
//  FirstPageView
//
//  Created by Shailesh on 10/12/14.
//  Copyright (c) 2014 houzify. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentController : UIViewController
/** IBOutlets for the interface elements */
@property (weak, nonatomic) IBOutlet UIImageView *contentImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
/* implementation to store the current index and image metadata */
@property NSUInteger pageIndex;
@property NSString *titleText;
@property NSString *imageFile;
@end
