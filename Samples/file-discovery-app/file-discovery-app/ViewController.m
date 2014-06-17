//
//  ViewController.m
//  file-discovery-app
//
//  Created by Lagash on 6/16/14.
//  Copyright (c) 2014 microsoft. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
            

@end

@implementation ViewController

ADAuthenticationContext* authContext;
NSString* authority;
NSString* redirectUriString;
NSString* resourceId;
NSString* clientId;
Credentials* credentials;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    authority = [NSString alloc];
    resourceId = [NSString alloc];
    clientId = [NSString alloc];
    redirectUriString = [NSString alloc];
    authority = @"https://login.windows.net/common";
    resourceId = @"Microsoft.SharePoint";//@"https://api.office.com/discovery/me/services";
    clientId = @"a31be332-2598-42e6-97f1-d8ac87370367";
    redirectUriString = @"https://lagash.com/oauth";

  //  HttpConnection* connection = [[HttpConnection alloc] init];
  //  OAuthentication* credentials = [OAuthentication alloc];
  //  [connection initializeWith: @"" credentials: credentials];
  //  [connection execute: @"GET"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
    
  
    // Dispose of any resources that can be recreated.
}

- (IBAction)LogIn:(id)sender {
    [self getToken:true completionHandler:^(NSString* accessToken){
        
        OAuthentication* authentication = [OAuthentication alloc];
        [authentication setToken:accessToken];
        FileDiscoveryClient* client = [FileDiscoveryClient alloc];
        [client getDiscoveryInfo:authentication];
    }];
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

@end