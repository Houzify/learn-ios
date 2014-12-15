//
//  Gist.h
//  RESTTutorial
//
//  Created by Shailesh on 11/12/14.
//  Copyright (c) 2014 houzify. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Model class to store a Gist from GitHub
 */
@interface Gist : NSObject

@property (nonatomic, strong) NSString *description;

@end
