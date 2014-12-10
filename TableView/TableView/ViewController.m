//
//  ViewController.m
//  TableView
//
//  Created by Shailesh on 24/11/14.
//  Copyright (c) 2014 houzify. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
static NSString *cellIdentifier = @"Cell Identifier";

- (void) viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.fruits = @[@"Almond" ,@"Apple", @"Apricot", @"Banana", @"Date", @"Kiwi",  @"Mango", @"Melon",
                    @"Orange", @"Pear", @"Peach", @"Pineapple", @"Plum", @"Strawberry", @"Walnut"];
    
    self.alphabetizedFruits = [self alphabetizeFruits:self.fruits];
    // Register the class for the cells in the table associated with the static identifier above.
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
}

/**
 * Alphabetizes an array of fruits into smaller groups
 */
- (NSDictionary *) alphabetizeFruits:(NSArray *)fruits {
    NSMutableDictionary *buffer = [[NSMutableDictionary alloc] init];
    
    // Index fruits by first letter
    for (int i = 0; i < [fruits count]; i++) {
        NSString* fruit = [fruits objectAtIndex:i];
        NSString* firstChar = [[fruit substringToIndex:1] uppercaseString];
        
        if ([buffer objectForKey:firstChar]) {
            [(NSMutableArray *)[buffer objectForKey:firstChar] addObject:fruit];
        } else {
            NSMutableArray *bufferForChar = [[NSMutableArray alloc] initWithObjects:fruit, nil];
            [buffer setObject:bufferForChar forKey:firstChar];
        }
    }
    
    // Sort the indexed fruits alphabetically.
    NSArray *keys = [buffer allKeys];
    for (int kidx = 0; kidx < [keys count]; kidx++) {
        NSMutableArray *fruitsForKey = [buffer objectForKey:[keys objectAtIndex:kidx]];
        [fruitsForKey sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    }
    
    NSDictionary *result = [NSDictionary dictionaryWithDictionary:buffer];
    return result;
}

- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 * Calculates the number of sections in the table view
 */
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    NSArray *keys = [self.alphabetizedFruits allKeys];
    return [keys count];
}

/**
 * Calculates the number of rows in a section
 */
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *sectionKey = [self sectionKey:section];
    NSArray *sectionFruits = [self.alphabetizedFruits objectForKey:sectionKey];
    return [sectionFruits count];
}

/**
 * Calculates the title for a given header row in a section
 */
- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self sectionKey:section];
}

/**
 * Given a section and a row within the section, fetches the contents of the cell for that row
 */
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    NSString *sectionKey = [self sectionKey:[indexPath section]];
    NSArray *sectionFruits = [self.alphabetizedFruits objectForKey:sectionKey];
    [cell.textLabel setText:[sectionFruits objectAtIndex:[indexPath row]]];
    
    return cell;
}

/**
 * Responds to selection of a given row
 */
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *sectionKey = [self sectionKey:[indexPath section]];
    NSArray *sectionFruits = [self.alphabetizedFruits objectForKey:sectionKey];
    NSString *selectedFruit = [sectionFruits objectAtIndex:[indexPath row]];
    
    NSLog(@"User selected fruit > %@", selectedFruit);
}

/**
 * Given a section number fetches the section key for the section
 */
- (NSString *) sectionKey:(NSInteger)section {
    NSArray *unsortedKeys = [self.alphabetizedFruits allKeys];
    NSArray *sortedKeys = [unsortedKeys sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    return [sortedKeys objectAtIndex:section];
}

@end
