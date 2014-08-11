//
//  ViewController.m
//  list-app
//
//  Created by Gustavo on 7/15/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//


#import "ViewController.h"
#import "ListTableViewController.h"
#import <office365-base-sdk/Credentials.h>
#import <office365-base-sdk/LoginClient.h>

@interface ViewController ()


@end

@implementation ViewController

ADAuthenticationContext* authContext;
NSString* authority;
NSString* redirectUriString;
NSString* resourceId;
NSString* clientId;
Credentials* credentials;
NSString* token;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    authority = [NSString alloc];
    resourceId = [NSString alloc];
    clientId = [NSString alloc];
    redirectUriString = [NSString alloc];
    authority = @"https://login.windows.net/common";
    resourceId = @"https://lagashsystems365.sharepoint.com";//@"https://lagashsystems365-my.sharepoint.com/";
    clientId = @"778a099e-ed6e-49a2-9f15-92c01366ad7d";//@"a31be332-2598-42e6-97f1-d8ac87370367";
    redirectUriString = @"https://lagash.com/oauth";
    token = [NSString alloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

-(void) redirectToServices:(NSString*)token{
    // ServiceTableViewController *destinationController = [[ServiceTableViewController alloc]initWithStyle:UITableViewStylePlain];
    
    // [destinationController addToken: token];
}


-(void)showError : (NSString*) errorDetails{
    
}

-(void) setStatus: (NSString*) status
{
    dispatch_async(dispatch_get_main_queue(), ^{
        // [self.resultLabel setText:status];
    });
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //if ([segue.identifier isEqualToString:...]) {
    
    ListTableViewController *controller = (ListTableViewController *)segue.destinationViewController;
    controller.token = token;
}

- (IBAction)LogIn:(id)sender {
    LoginClient *client = [[LoginClient alloc] initWithParameters: clientId: redirectUriString:resourceId :authority];
    
    [client login:TRUE completionHandler:^(NSString *t, NSError *e) {
        if(e == nil)
        {
            token = t;
            //self.GetFilesButton.enabled = true;
            self.LogInButton.enabled = false;
        }
        else
        {
            NSString *errorMessage = [@"Login failed. Reason: " stringByAppendingString: e.description];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:errorMessage delegate:self cancelButtonTitle:@"Retry" otherButtonTitles:@"Cancel", nil];
            [alert show];
        }
    }];
}
@end