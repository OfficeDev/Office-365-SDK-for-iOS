/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "BaseController.h"
#import "FilesTableViewController.h"


@interface FilesTableViewController()

@property NSArray *Files;
@property MSSharePointClient* client;

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
    
    [BaseController getClient:^(MSSharePointClient * client) {
        
        self.client = client;
        [self getFiles];
    }];
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
    
    MSSharePointItem *file = (MSSharePointItem*)[self.Files objectAtIndex:indexPath.row];
    
    cell.textLabel.text = file.name;
    
    return cell;
}

-(void)getFiles {
    
    UIActivityIndicatorView *spinner = [BaseController getSpinner:self.view];
    
    
    [self.client.files readWithCallback:^(NSArray *items, MSOrcError *error) {
        
        if (error == nil) {
            
            dispatch_async(dispatch_get_main_queue(),
                           ^{
                               self.Files = items;
                               [self.tableView reloadData];
                               [spinner stopAnimating];
                           });
        }
        else{
            dispatch_async(dispatch_get_main_queue(),
                           ^{
                               [spinner stopAnimating];
                               
                               UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:[[error userInfo] objectForKey:0] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                               [alert show];
                           });
        }
    }];
}

- (IBAction)unwindExchangeViews:(UIStoryboardSegue *)segue{
}

- (IBAction)Refresh:(id)sender {
    [self getFiles];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        __block UIActivityIndicatorView *spinner = [BaseController getSpinner:self.view];
        
        MSSharePointFile *fileToDelete = [self.Files objectAtIndex:indexPath.row];
        
        [[self.client.files getById:fileToDelete.id] delete:^(int status, MSOrcError *error) {
            
            dispatch_async(dispatch_get_main_queue(),
                           ^{
                               
                               [spinner stopAnimating];
                               [self getFiles];
                               
                               UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                                               message:[@"Deleted File " stringByAppendingString:fileToDelete.name]
                                                                              delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                               [alert show];
                           });
            
        }];
        
    }
}

@end