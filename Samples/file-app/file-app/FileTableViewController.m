//
//  FileTableViewController.m
//  file-app
//
//  Created by Lagash on 6/23/14.
//  Copyright (c) 2014 microsoft. All rights reserved.
//
#import "FilesTableViewController.h"
#import "FileTableViewCell.h"
#import <office365-files-sdk/FileEntity.h>
#import <office365-files-sdk/FileClient.h>

#import <office365-base-sdk/OAuthentication.h>

@implementation FileTableViewController

UIView* popUpView;
UILabel* popUpLabel;
UIView* blockerPanel;
FileEntity* currentEntity;
NSURLSessionDownloadTask* task;

- (void)Cancel{
    [task cancel];
    [self disposeBlockerPanel];
    [self.navigationItem.rightBarButtonItem setTitle: @"Create"];
}

- (void)viewDidLoad
{
    [self.navigationItem.rightBarButtonItem  setTitle: @"Create"];
    [super viewDidLoad];
    
    self.fileItems = [[NSMutableArray alloc] init];
    
    [self loadData];
}

-(void)disposeBlockerPanel{
    
    blockerPanel.hidden = true;
    popUpView = nil;
    blockerPanel = nil;
    self.tableView.scrollEnabled = true;
    self.navigationController.navigationItem.backBarButtonItem.Enabled = true;
}

-(void)loadData{
    
    UIActivityIndicatorView* spinner = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(135,140,50,50)];
    spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [self.view addSubview:spinner];
    spinner.hidesWhenStopped = YES;
    
    [spinner startAnimating];
    
    FileClient* client = [self getClient];
    
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
    FileTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier: identifier ];
    
    cell.DownloadButton.hidden = true;
    FileEntity *item = [self.fileItems objectAtIndex:indexPath.row];
    cell.FileName.text = item.Name;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.fileItems count];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"CreateSegue"]) {
        CreateViewController *controller = (CreateViewController *)segue.destinationViewController;
        controller.token = self.token;
    }
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    NSString* name = self.navigationItem.rightBarButtonItem.title ;
    
    if([name isEqualToString:@"Create"]){
        return true;
    }
    
    [self Cancel];
    
    return false;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (IBAction)Download:(id)sender {
    
    [self createBlockerPanel];
    
    __weak typeof(self) weakSelf = self;
    
    task = [[self getClient] download:currentEntity.Id delegate: weakSelf];
    [task resume];
}

-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location
{
    NSLog(@"Temporary File :%@\n", location);
    NSError *err = nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *docsDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSURL *docsDirURL = [NSURL fileURLWithPath:[docsDir stringByAppendingPathComponent:currentEntity.Name]];
    if ([fileManager moveItemAtURL:location toURL:docsDirURL error: &err])
    {
        NSLog(@"File is saved to =%@",docsDir);
    }
    else
    {
        NSLog(@"failed to move: %@",[err userInfo]);
    }
    
    [self disposeBlockerPanel];
}

-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    int size = currentEntity.Size;
    popUpLabel.text = [NSString stringWithFormat: @"Downloaded: %lld of %d bytes.", totalBytesWritten, size];
    [popUpView addSubview:popUpLabel];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger lastSelected = [self.fileItems indexOfObject:currentEntity];
    
    if(lastSelected != NSIntegerMax){
        NSIndexPath *oldIndexPath = [NSIndexPath indexPathForRow:lastSelected inSection:0];
        FileTableViewCell* lastCell = (FileTableViewCell*)[tableView cellForRowAtIndexPath:oldIndexPath];
        lastCell.DownloadButton.hidden = true;
    }
    
    FileTableViewCell* cell =(FileTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
    
    currentEntity= [self.fileItems objectAtIndex:indexPath.row];
    
    if(![currentEntity isFolder]) cell.DownloadButton.hidden = false;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        FileEntity* file = [self.fileItems objectAtIndex:indexPath.row];
        UIActivityIndicatorView* spinner = [self loadingProgress];
        
        
        NSURLSessionDataTask* task = [[self getClient] delete: file.Name
                     callback:^(NSData * data, NSURLResponse * response, NSError * error) {
                         NSError* parseError = nil;

                         dispatch_async(dispatch_get_main_queue(), ^{
                             [self.fileItems removeObject:file];
                             [self.tableView reloadData];
                             
                             self.tableView.scrollEnabled = true;
                             [spinner stopAnimating];
                             blockerPanel.hidden = true;
                         });
                     }];
    
        [task resume];
    }
}

-(UIActivityIndicatorView*)loadingProgress{
    
    int y = self.tableView.contentOffset.y;
    int width = self.view.frame.size.width;
    int height = self.view.frame.size.height;
    
    
    UIActivityIndicatorView* spinner = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(135,140,50,50)];
    self.tableView.scrollEnabled = false;
    spinner.hidesWhenStopped = YES;
    
    blockerPanel = [[UIView alloc] initWithFrame:CGRectMake(0,y,width,height)];
    blockerPanel.backgroundColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:.7];
    [blockerPanel addSubview:spinner];
    
    spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    
    [self.view addSubview:blockerPanel];
    [spinner startAnimating];
    return spinner;
}

-(FileClient*)getClient{
    OAuthentication* authentication = [OAuthentication alloc];
    [authentication setToken:self.token];
    
    return [[FileClient alloc] initWithUrl:@"https://lagashsystems365-my.sharepoint.com/personal/gustavoh_lagash_com"
                               credentials: authentication];
}

-(void)createBlockerPanel{
    
    [self.navigationController.navigationItem.backBarButtonItem setEnabled:false];
    [self.navigationItem.rightBarButtonItem  setTitle: @"Cancel"];
    
    int y = self.tableView.contentOffset.y;
    int width = self.view.frame.size.width;
    int height = self.view.frame.size.height;
    
    blockerPanel = [[UIView alloc] initWithFrame:CGRectMake(0,y,width,height)];
    blockerPanel.backgroundColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:.7];
    
    popUpView = [[UIView alloc]initWithFrame:CGRectMake(40, 50, 250, 80)];
    popUpView.backgroundColor = [UIColor whiteColor];
    popUpView.layer.borderColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0].CGColor;
    popUpView.layer.borderWidth = 1.0f;
    popUpView.layer.shadowColor = [UIColor grayColor].CGColor;
    popUpView.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
    popUpView.layer.shadowOpacity =1.0f;
    
    popUpLabel= [[UILabel alloc] initWithFrame:CGRectMake(30, 10, 190, 60)];
    popUpLabel.textColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0];
    popUpLabel.lineBreakMode = NSLineBreakByWordWrapping;
    popUpLabel.numberOfLines = 2;
    
    blockerPanel.hidden = true;
    
    [blockerPanel addSubview:popUpView];
    [self.view addSubview:blockerPanel];
    
    self.tableView.scrollEnabled = false;
    blockerPanel.hidden = false;
}

@end