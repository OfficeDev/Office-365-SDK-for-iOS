//
//  FileTableViewController.m
//  file-app
//
//  Created by Lagash on 6/23/14.
//  Copyright (c) 2014 microsoft. All rights reserved.
//
#import "FilesTableViewController.h"

@implementation FileTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.fileItems = [[NSMutableArray alloc] init];
    
    [self loadData];
}

-(void)loadData{
    
    UIActivityIndicatorView* spinner = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(135,140,50,50)];
    spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [self.view addSubview:spinner];
    spinner.hidesWhenStopped = YES;

    [spinner startAnimating];
    
    OAuthentication* authentication = [OAuthentication alloc];
    [authentication setToken:self.token];

    FileClient* client = [[FileClient alloc] initWithUrl:@"https://lagashsystems365-my.sharepoint.com/personal/gustavoh_lagash_com" credentials: authentication];
    
    NSURLSessionTask* task = [client getFiles: nil
                                     callback:^(NSData * data, NSURLResponse * response, NSError * error) {
                                         NSError* parseError = nil;
                                         
                                         self.fileItems  =[client parseData : data];
                                         
                                         dispatch_async(dispatch_get_main_queue(), ^{
                                             [self.tableView reloadData];
                                             [spinner stopAnimating];
                                         });
                                     }];
    
    [task resume];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* identifier = @"FileListCell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier: identifier forIndexPath:indexPath];
    	
    FileEntity *item = [self.fileItems objectAtIndex:indexPath.row];
    cell.textLabel.text = item.Name;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.fileItems count];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //if ([segue.identifier isEqualToString:...]) {
    
    CreateViewController *controller = (CreateViewController *)segue.destinationViewController;
    controller.token = self.token;
}

@end