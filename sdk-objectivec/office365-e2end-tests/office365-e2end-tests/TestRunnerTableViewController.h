//
//  TestRunnerTableViewController.h
//  office365-e2end-tests
//
//  Created by Anahi Hojnadel on 11/13/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTestRunner.h"
#import "Test.h"
@interface TestRunnerTableViewController : UITableViewController
@property NSMutableArray *Tests;
@property BaseTestRunner *TestRunner;

- (IBAction)RunAllTests:(id)sender;

@end
