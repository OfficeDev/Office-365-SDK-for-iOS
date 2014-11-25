/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import <UIKit/UIKit.h>
#import "TestRunnerTableViewController.h"
#import "MailTestRunner.h"
#import "FilesTestRunner.h"
#import "DiscoveryTestRunner.h"
@interface SDKListTableViewController : UITableViewController

@property NSMutableArray *availableSdks;

@end
