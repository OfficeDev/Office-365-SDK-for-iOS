/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <UIKit/UIKit.h>
#import "BaseTestRunner.h"
#import "Test.h"
#import "TestRunDetailViewController.h"

@interface TestRunnerTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *Tests;
@property (nonatomic, strong) BaseTestRunner *TestRunner;

- (IBAction)RunAllTests:(id)sender;

@end
