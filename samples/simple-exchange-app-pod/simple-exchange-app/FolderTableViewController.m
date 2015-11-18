/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "FolderTableViewController.h"
#import "BaseController.h"
#import <office365_exchange_sdk/office365_exchange_sdk.h>

@interface FolderTableViewController()

@property NSArray *Folders;
@property MSOutlookClient* client;

@end

@implementation FolderTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [BaseController getClient:^(MSOutlookClient *client) {
        self.client = client;
        [self getFolders];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.Folders.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FolderCell" forIndexPath:indexPath];
    
    MSOutlookFolder *folder = (MSOutlookFolder*)[self.Folders objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@" ,folder.displayName];
    
    return cell;
}

- (void)getFolders {
    
    [self.client.me.folders readWithCallback:^(NSArray<MSOutlookFolder> *folders, MSOrcError *error) {
        
        if (error == nil) {
            
            dispatch_async(dispatch_get_main_queue(),
                           ^{
                               self.Folders = folders;
                               [self.tableView reloadData];
                           });
        }
    }];
}

- (IBAction)unwindExchangeViews:(UIStoryboardSegue *)segue{
    
}

@end