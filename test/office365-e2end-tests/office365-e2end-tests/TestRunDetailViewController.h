/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import "ViewController.h"
#import "TestRunDetailViewController.h"
#import "Test.h"

@interface TestRunDetailViewController : ViewController

@property (weak, nonatomic) Test *testRunned;

- (void)initWithTest:(Test *)test;

@property (weak, nonatomic) IBOutlet UILabel *testSummary;
@property (weak, nonatomic) IBOutlet UILabel *testName;

@end
