/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "FilesTableViewController.h"
#import "BaseController.h"

//#import <office365_exchange_sdk/office365_exchange_sdk-Prefix.pch>

@interface FilesTableViewController()

@property NSArray *Files;

@end

@implementation FilesTableViewController

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
    [self getFiles];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.Files.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FileCell" forIndexPath:indexPath];
    
    MSOItem *file = (MSOItem*)[self.Files objectAtIndex:indexPath.row];
    
    cell.textLabel.text = file.name;
    
    return cell;
}

-(void)getFiles{
    [[BaseController alloc] getClient:^(MSOEntityContainerClient * client) {
            [[[[client getme] getfiles] execute:^(NSArray<MSOItem> *items, NSError *error) {
                if(error == nil){
                    dispatch_async(dispatch_get_main_queue(),
                                   ^{
                                      self.Files = items;
                                    [self.tableView reloadData];
                                   });
                }
            }] resume];
    }];
}

-(void)downloadFiles{
    
}

- (IBAction)unwindExchangeViews:(UIStoryboardSegue *)segue{
}

@end