/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "BaseController.h"
#import "AuthenticationController.h"

@implementation BaseController

-(void)getMailClient : (void (^) (MSOutlookClient* ))callback{
    
    AuthenticationController* authenticationController = [AuthenticationController getInstance];
    NSString* hostName = @"https://outlook.office365.com";
    
    [authenticationController initialize:hostName :true completionHandler:^(bool authenticated) {
        
        if(authenticated){
            callback([[MSOutlookClient alloc] initWithUrl:[hostName stringByAppendingString:@"/api/v1.0"] dependencyResolver:[authenticationController getDependencyResolver]]);
        }
        else{
            NSLog(@"Error in the authentication");
        }
    }];
}

-(void) getSharePointClient:(void (^)(MSSharePointClient *))callback{
    
    AuthenticationController* authenticationController = [AuthenticationController getInstance];
    NSString* hostName = @"https://msopentechtest01-my.sharepoint.com";
    
    [authenticationController initialize:hostName :true completionHandler:^(bool authenticated) {
        
        if(authenticated){
            callback([[MSSharePointClient alloc] initWithUrl:[hostName stringByAppendingString:@"/_api/v1.0/me"] dependencyResolver:[authenticationController getDependencyResolver]]);
        }
        else{
            NSLog(@"Error in the authentication");
        }
    }];
}

-(void) getDiscoveryClient:(void (^)(MSDiscoveryClient *))callback{
    
    AuthenticationController* authenticationController = [AuthenticationController getInstance];
    NSString* hostName = @"https://api.office.com/discovery";
    
    [authenticationController initialize:hostName :true completionHandler:^(bool authenticated) {
        
        if(authenticated){
            callback([[MSDiscoveryClient alloc] initWithUrl:[hostName stringByAppendingString:@"/v1.0/me"] dependencyResolver:[authenticationController getDependencyResolver]]);
        }
        else{
            NSLog(@"Error in the authentication");
        }
    }];
}
@end