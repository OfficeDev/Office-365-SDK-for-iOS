/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <UIKit/UIKit.h>

@interface ListTestTableViewController : UITableViewController

- (IBAction)RunAllTests:(id)sender;
- (IBAction)RunSelectedTests:(id)sender;

@property NSMutableArray *Tests;

@end