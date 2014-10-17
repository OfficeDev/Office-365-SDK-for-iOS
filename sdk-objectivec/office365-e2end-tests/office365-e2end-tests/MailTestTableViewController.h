//
//  FileTestTableViewController.h
//  office365-e2end-tests
//
//  Created by Gustavo on 7/22/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MailTestTableViewController : UITableViewController

- (IBAction)RunAllTests:(id)sender;

@property NSMutableArray *Tests;

@end