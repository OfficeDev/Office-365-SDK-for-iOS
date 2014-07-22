//
//  FilesTableViewController.h
//  file-app
//
//  Created by Lagash on 6/23/14.
//  Copyright (c) 2014 microsoft. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "CreateViewController.h"

@interface FileTableViewController : UITableViewController

@property NSMutableArray *fileItems;
@property NSString* token;

- (IBAction)Download:(id)sender;

@end