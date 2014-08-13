//
//  TestFilesTableViewController.h
//  office365-e2end-tests
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestFilesTableViewController : UITableViewController

- (IBAction)RunAllTests:(id)sender;

@property NSMutableArray *Tests;

@end