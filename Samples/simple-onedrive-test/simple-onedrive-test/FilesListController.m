//
//  FilesListController.m
//  simple-onedrive-test
//
//  Created by Gustavo on 8/6/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import "FilesListController.h"


#import "AddViewController.h"

#import <office365-files-sdk/FileClient.h>
#import <office365-base-sdk/OAuthentication.h>
#import <office365-base-sdk/LoginClient.h>
@interface FilesListController ()

@end

@implementation FilesListController

NSMutableArray *files;

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
    
    files = [NSMutableArray array];
    token = [NSString alloc];
    [self login];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

ADAuthenticationContext* authContext;
NSString* authority;
NSString* redirectUriString;
NSString* resourceId;
NSString* clientId;
NSString* token;

- (void) login{
    
    authority = [NSString alloc];
    resourceId = [NSString alloc];
    clientId = [NSString alloc];
    redirectUriString = [NSString alloc];
    
    
    authority = @"https://login.windows.net/common";
    resourceId = @"https://lagashsystems365-my.sharepoint.com/";
    clientId = @"a31be332-2598-42e6-97f1-d8ac87370367";
    redirectUriString = @"https://lagash.com/oauth";
    /*
    authority = @"https://login.windows.net/common";
    resourceId = @"https://lagashsystems365.sharepoint.com";//@"https://lagashsystems365-my.sharepoint.com/";
    clientId = @"778a099e-ed6e-49a2-9f15-92c01366ad7d";//@"a31be332-2598-42e6-97f1-d8ac87370367";
    redirectUriString = @"https://lagash.com/oauth";*/
    
    /*
    LoginController *loginController = [[LoginController alloc] initWithParameters:clientId:redirectUriString:resourceId:authority];
    
    [loginController login:true completionHandler:^(NSString *t) {
        token = t;
        [self getFiles:nil];
    }];
    */
    
    LoginClient *client = [[LoginClient alloc] initWithParameters:clientId:redirectUriString:resourceId:authority];
    [client login:TRUE completionHandler:^(NSString *t) {
        token = t;
        [self getFiles:nil];
    }];
    
    /*
    [self getToken:true completionHandler:^(NSString * t) {
        token = t;
        [self getFiles:nil];
    }];
     */
}

/*
-(void) getToken : (BOOL) clearCache completionHandler:(void (^) (NSString*))completionBlock;
{
    ADAuthenticationError *error;
    authContext = [ADAuthenticationContext authenticationContextWithAuthority:authority
                                                                        error:&error];
    
    NSURL *redirectUri = [NSURL URLWithString:redirectUriString];
    
    if(clearCache){
        [authContext.tokenCacheStore removeAll];
    }
    
    [authContext acquireTokenWithResource:resourceId
                                 clientId:clientId
                              redirectUri:redirectUri
                          completionBlock:^(ADAuthenticationResult *result) {
                              if (AD_SUCCEEDED != result.status){
                                  // display error on the screen
                                 // [self showError:result.error.errorDetails];
                              }
                              else{
                                  completionBlock(result.accessToken);
                              }
                          }];
}
 */

/*
- (void) viewDidAppear:(BOOL)animated{
        [self getFiles:nil];
}
*/
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [files count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = ((FileEntity*)[files objectAtIndex:indexPath.row]).Name;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    AddViewController *controller = (AddViewController*)[segue destinationViewController];
    controller.files = files;
    controller.token = token;
}


- (IBAction)getFiles:(id)sender {
    
    if(token == nil){
        return;
    }
    
    UIActivityIndicatorView* spinner = [self getSpinner];
    [self.view addSubview: spinner];
    [spinner startAnimating];
    NSString *url = @"https://lagashsystems365-my.sharepoint.com/personal/anahih_lagash_com";
    OAuthentication * cred = [[OAuthentication alloc] initWith:token];
    
    FileClient *client = [FileClient alloc];
    client = [client initWithUrl:url credentials:cred];
    
    NSURLSessionDataTask *task = [client getFiles:^(NSMutableArray *f, NSError *error) {

        files = f;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [spinner stopAnimating];
        });
    }];
    
    [task resume];
    
}

- (UIActivityIndicatorView*) getSpinner{
    UIActivityIndicatorView* spinner = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(135,140,50,50)];
    
    spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    
    spinner.hidesWhenStopped = YES;
    
    return spinner;
}

@end
