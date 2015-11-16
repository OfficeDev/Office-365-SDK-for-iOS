/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import <UIKit/UIKit.h>
#import "TestRunnerTableViewController.h"
#import "MailTestRunner.h"
//#import "FilesTestRunner.h"
#import "DiscoveryTestRunner.h"
#import "OneNoteTestRunner.h"
#import "MSGraphTestRunner.h"
#import "LiveAuthDelegate.h"

@interface SDKListTableViewController : UITableViewController<LiveAuthDelegate>

@property (nonatomic, strong) NSMutableArray *availableSdks;

@end
