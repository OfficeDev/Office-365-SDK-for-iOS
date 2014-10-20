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
    [self getFolders];
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
    
    MSOFolder *folder = (MSOFolder*)[self.Folders objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@" ,folder.DisplayName];
    
    return cell;
}

-(void)getFolders{

    [[BaseController alloc] getClient:^(MSOEntityContainerClient *client) {
        NSURLSessionTask* task = [[[client getMe] getFolders] execute:^(NSArray<MSOFolder> *folders, NSError *error) {
            if(error == nil){
                dispatch_async(dispatch_get_main_queue(),
                               ^{
                                   self.Folders = folders;
                                   [self.tableView reloadData];
                               });
            }
        }];
        
        [task resume];
    }];
}
- (IBAction)unwindExchangeViews:(UIStoryboardSegue *)segue{
    
}

@end