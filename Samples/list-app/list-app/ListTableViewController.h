//
//  ListTableViewController.h
//  list-app
//
//  Created by Gustavo on 7/15/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <office365_base_sdk/office365_base_sdk-Swift.h>
#import <office365_list_sdk/office365_list_sdk-Swift.h>

@interface ListTableViewController : UITableViewController

@property NSMutableArray* SharepointList;
@property NSString* token;

@end
