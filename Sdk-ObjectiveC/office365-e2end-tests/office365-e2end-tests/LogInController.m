//
//  LogInSerivce.m
//  simple-exchange-app
//
//  Created by Gustavo on 7/17/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "LogInController.h"

@implementation LogInController

ADAuthenticationContext* authContext;
NSString* authority;
NSString* redirectUriString;
NSString* clientId;
NSString* token;

-(id)init{
    
    authority = @"https://login.windows.net/common";
    clientId = @"a31be332-2598-42e6-97f1-d8ac87370367";
    redirectUriString = @"https://lagash.com/oauth";
    token = [NSString alloc];
    
    return self;
}

-(void) getTokenWith :(NSString*)resourceId : (BOOL) clearCache completionHandler:(void (^) (NSString*))completionBlock;
{
    ADAuthenticationError *error;
    authContext = [ADAuthenticationContext authenticationContextWithAuthority:authority error:&error];
    
    NSURL *redirectUri = [NSURL URLWithString:redirectUriString];
    
    if(clearCache){
        [authContext.tokenCacheStore removeAll];
    }
    
   /* completionBlock(@"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6ImtyaU1QZG1Cdng2OHNrVDgtbVBBQjNCc2VlQSJ9.eyJhdWQiOiJodHRwczovL2xhZ2FzaHN5c3RlbXMzNjUuc2hhcmVwb2ludC5jb20iLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC81YWI5YWY5Yi00NTM0LTRjMzEtOGU1MC0xZTA5ODQ2MTQ4MWMvIiwiaWF0IjoxNDA2NTcwNzQxLCJuYmYiOjE0MDY1NzA3NDEsImV4cCI6MTQwNjU3NDY0MSwidmVyIjoiMS4wIiwidGlkIjoiNWFiOWFmOWItNDUzNC00YzMxLThlNTAtMWUwOTg0NjE0ODFjIiwiYW1yIjpbInB3ZCJdLCJvaWQiOiJmNzlmNWQyYy1lN2MyLTQwYTctOTFkZi02MjhhNmYxMzlmNDEiLCJ1cG4iOiJndXN0YXZvaEBsYWdhc2guY29tIiwidW5pcXVlX25hbWUiOiJndXN0YXZvaEBsYWdhc2guY29tIiwic3ViIjoiN0FGOEVFbjlYcTMzcVp0TEpXSkN6eGpQcUp3NXY1Vjhkd19jYTlTcU1FTSIsInB1aWQiOiIxMDAzQkZGRDg4QzFFNzZDIiwiZmFtaWx5X25hbWUiOiJIYW5zZW4iLCJnaXZlbl9uYW1lIjoiR3VzdGF2byIsImFwcGlkIjoiNzc4YTA5OWUtZWQ2ZS00OWEyLTlmMTUtOTJjMDEzNjZhZDdkIiwiYXBwaWRhY3IiOiIwIiwic2NwIjoiTXlGaWxlcy5Xcml0ZSBNeUZpbGVzLlJlYWQgQWxsU2l0ZXMuRnVsbENvbnRyb2wgQWxsU2l0ZXMuTWFuYWdlIEFsbFNpdGVzLldyaXRlIEFsbFNpdGVzLlJlYWQiLCJhY3IiOiIxIn0.DOHpDmcIoZsqp9O3nYcaf4GS5gmS3g_2a8I-_aStltbov4qVZJ546BeD6wln4ivcoS7n8I5TCD3-S97tazE_tcx7eOWZkTdzmLYCJcp7kP7tQrUmHXUg_3QYLRFSXjpSP7eOhyAmecgkZUWIUA2q8-9IVKnCJTb74kUkvsX2YUKlPvT3Rc0ApVQu5oHCw4Da4ikr6Lr1a3T-pUayTpeW04XtdKerPNqhelPmRp7dOW_kPQzZFHPKBtlY7dQctn9iidDEFXi_m8OIUQ5u_J4xTs1zO41KhCUZTjvwpwyVueBtRJe823ZnM79rt_rvjZlmwrS9EAVonfTgXZbUfWCXHg")
    ;*/
    
    [authContext acquireTokenWithResource:resourceId
                                 clientId:clientId
                              redirectUri:redirectUri
                          completionBlock:^(ADAuthenticationResult * result) {
                              if (AD_SUCCEEDED != result.status){
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