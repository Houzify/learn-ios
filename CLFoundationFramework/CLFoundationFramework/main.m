//
//  main.m
//  CLFoundationFramework
//
//  Created by Shailesh on 24/11/14.
//  Copyright (c) 2014 houzify. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSArray *firstArray = [NSArray arrayWithObjects:@"Bread", @"Butter", @"Milk", @"Eggs", nil];
        NSLog(@"Number of elements > %li", [firstArray count]);
        NSLog(@"Element at position 3 > %@", [firstArray objectAtIndex:2]);
        
        NSMutableArray *secondArray = [NSMutableArray arrayWithObject:[NSNumber numberWithInt:255]];
        [secondArray addObject:[NSNumber numberWithInt:45]];
        NSLog(@"Mutable array   > %@", secondArray);
        
        NSString *stringKey = @"myKey";
        NSDictionary *firstDict = [NSDictionary dictionaryWithObject:@"This is a string" forKey:@"myKey"];
        for (NSString *key in firstDict) {
            NSLog(@"%@: %@", key, [firstDict objectForKey:key]);
        }
    }
    return 0;
}


