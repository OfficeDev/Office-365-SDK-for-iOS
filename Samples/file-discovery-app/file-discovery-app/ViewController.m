//
//  ViewController.m
//  file-discovery-app
//
//  Created by Lagash on 6/16/14.
//  Copyright (c) 2014 microsoft. All rights reserved.
//

#import "ViewController.h"
#import "ServiceTableViewController.h"
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
    resourceId = @"Microsoft.SharePoint";
    clientId = @"a31be332-2598-42e6-97f1-d8ac87370367";
    redirectUriString = @"https://lagash.com/oauth";
    token = [NSString alloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
    // Dispose of any resources that can be recreated.
}

- (IBAction)LogIn:(id)sender {
    
    LoginClient *client = [[LoginClient alloc] initWithParameters:clientId:redirectUriString:resourceId:authority];
    [client login:TRUE completionHandler:^(NSString *t, NSError *e) {
        if(e == nil)
        {
            /* OAuthentication* authentication = [OAuthentication alloc];
             [authentication setToken:accessToken];
             FileDiscoveryClient* client = [FileDiscoveryClient alloc];
             NSURLSessionDataTask* task = [client getDiscoveryInfo:authentication callback:^(NSData* data, NSURLResponse* response, NSError* error) {
             
             [self redirectToServices];
             if(error != nil){
             }
             }];
             
             [task resume];*/
            // [self redirectToServices : accessToken];
            
            token = t;
            self.GetServicesButton.enabled = true;
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

-(void) redirectToServices:(NSString*)token{
    ServiceTableViewController *destinationController = [[ServiceTableViewController alloc]initWithStyle:UITableViewStylePlain];
    
    [destinationController addToken: token];
    
    //[UIView transitionWithView:self.navigationController.view duration:0.2
      //                 options:UIViewAnimationOptionTransitionFlipFromLeft
       //             animations:^{
        //                [self.navigationController pushViewController:destinationController animated:NO];
         //           }
          //          completion:NULL];
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
        
        ServiceTableViewController *controller = (ServiceTableViewController *)segue.destinationViewController;
        controller.token = token;
}

@end