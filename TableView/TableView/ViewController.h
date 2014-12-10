//
//  ViewController.h
//  TableView
//
//  Created by Shailesh on 24/11/14.
//  Copyright (c) 2014 houzify. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

/** Properties to hold the objects data */
@property IBOutlet UITableView *tableView;
@property NSArray *fruits;
@property NSDictionary *alphabetizedFruits;


@end

