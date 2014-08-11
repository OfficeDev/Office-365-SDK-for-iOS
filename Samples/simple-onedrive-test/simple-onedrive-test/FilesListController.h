//
//  FilesListController.h
//  simple-onedrive-test
//
//  Created by Gustavo on 8/6/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <office365-base-sdk/LoginClient.h>
@interface FilesListController : UITableViewController
- (IBAction)getFiles:(id)sender;

@property NSString* token;

@end
