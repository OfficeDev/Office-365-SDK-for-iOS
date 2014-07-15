//
//  ViewController.m
//  list-app
//
//  Created by Gustavo on 7/15/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//


#import "ViewController.h"
#import "ListTableViewController.h"

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
    resourceId = @"https://lagashsystems365-my.sharepoint.com/";
    clientId = @"a31be332-2598-42e6-97f1-d8ac87370367";
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
    
    ListTableViewController *controller = (ListTableViewController *)segue.destinationViewController;
  //  controller.token = token;
}

- (IBAction)LogIn:(id)sender {
    [self getToken:true completionHandler:^(NSString* accessToken){
        
        token = accessToken;
        //self.GetFilesButton.enabled = true;
        self.LogInButton.enabled = false;
    }];
}
@end