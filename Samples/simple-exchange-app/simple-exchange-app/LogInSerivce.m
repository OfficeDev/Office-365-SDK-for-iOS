//
//  LogInSerivce.m
//  simple-exchange-app
//
//  Created by Gustavo on 7/17/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "LogInSerivce.h"

@implementation LogInSerivce

ADAuthenticationContext* authContext;
NSString* authority;
NSString* redirectUriString;
NSString* resourceId;
NSString* clientId;
NSString* token;

-(instancetype)init{
    
    authority = [NSString alloc];
    resourceId = [NSString alloc];
    clientId = [NSString alloc];
    redirectUriString = [NSString alloc];
    authority = @"https://login.windows.net/common";
    resourceId = @"https://outlook.office365.com/";//@"https://lagashsystems365-my.sharepoint.com/";
    clientId = @"a31be332-2598-42e6-97f1-d8ac87370367";
    redirectUriString = @"https://lagash.com/oauth";
    token = [NSString alloc];
    
    return self;
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

-(NSString*)getTokenString{
    
    return token;
};

-(BOOL)isAuthenticated{
    return token == nil;
}

@end