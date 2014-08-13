//
//  TestFilesTableViewController.h
//  office365-e2end-tests
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestFilesTableViewController : UITableViewController

@property NSMutableArray *Tests;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *RunAllTest;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *CancelBtn;

- (IBAction)Cancel:(id)sender;
- (IBAction)RunAllTests:(id)sender;

@end