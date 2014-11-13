//
//  SDKListTableViewController.h
//  office365-e2end-tests
//
//  Created by Anahi Hojnadel on 11/13/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestRunnerTableViewController.h"
#import "MailTestRunner.h"
#import "FilesTestRunner.h"
@interface SDKListTableViewController : UITableViewController

@property NSMutableArray *availableSdks;

@end
