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
    [self getToken:true completionHandler:^(NSString* accessToken){
        
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
   
        token = accessToken;
        self.GetServicesButton.enabled = true;
        self.LogInButton.enabled = false;
        
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

-(void) getToken : (BOOL) clearCache completionHandler:(void (^) (NSString*))completionBlock;
{
    ADAuthenticationError *error;
    authContext = [ADAuthenticationContext authenticationContextWithAuthority:authority error:&error];
    
    NSURL *redirectUri = [NSURL URLWithString:redirectUriString];
    
    if(clearCache){
        [authContext.tokenCacheStore removeAll];
    }
    
    [authContext acquireTokenWithResource:resourceId
                                 clientId:clientId
                              redirectUri:redirectUri
                          completionBlock:^(ADAuthenticationResult * result) {
                              if (AD_SUCCEEDED != result.status){
                                  // display error on the screen
                                  [self showError:result.error.errorDetails];
                              }
                              else{
                                  completionBlock(result.accessToken);
                              }
                          }];
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