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
            callback([[MSOutlookClient alloc] initWithUrl:[hostName stringByAppendingString:@"/api/v2.0"] dependencyResolver:[authenticationController getDependencyResolver]]);
        }
        else{
            NSLog(@"Error in the authentication");
        }
    }];
}

/*
-(void) getFilesClient:(void (^)(MSFilesClient *))callback{
    
    AuthenticationController* authenticationController = [AuthenticationController getInstance];
    NSString* hostName = @"https://msopentechtest01-my.sharepoint.com";
    
    [authenticationController initialize:hostName :true completionHandler:^(bool authenticated) {
        
        if(authenticated){
            callback([[MSFilesClient alloc] initWithUrl:[hostName stringByAppendingString:@"/_api/v2.0/me"] dependencyResolver:[authenticationController getDependencyResolver]]);
        }
        else{
            NSLog(@"Error in the authentication");
        }
    }];
}
 */

-(void) getDiscoveryClient:(void (^)(MSDiscoveryClient *))callback{
    
    AuthenticationController* authenticationController = [AuthenticationController getInstance];
    NSString* hostName = @"https://api.office.com/discovery";
    
    [authenticationController initialize:hostName :true completionHandler:^(bool authenticated) {
        
        if(authenticated){
            callback([[MSDiscoveryClient alloc] initWithUrl:[hostName stringByAppendingString:@"/v2.0/me"] dependencyResolver:[authenticationController getDependencyResolver]]);
        }
        else{
            NSLog(@"Error in the authentication");
        }
    }];
}

-(void) getMSGraphClient:(void (^)(MSGraphServiceClient *))callback{
    
    AuthenticationController* authenticationController = [AuthenticationController getInstance];
    NSString* hostName = @"00000003-0000-0000-c000-000000000000";
    
    [authenticationController initialize:hostName :true completionHandler:^(bool authenticated) {
        
        if(authenticated){
            callback([[MSGraphServiceClient alloc] initWithUrl:@"https://graph.microsoft.com/v1.0/" dependencyResolver:[authenticationController getDependencyResolver]]);
        }
        else{
            NSLog(@"Error in the authentication");
        }
    }];
}

-(void) getOneNoteClient: (UIViewController*) viewController :(void (^)(MSOneNoteApiClient *))callback{
    
    AuthenticationController* authenticationController = [AuthenticationController getInstance];

    [authenticationController initializeWithLiveSDK:viewController completionHandler:^(bool authenticated) {
        callback([self getOneNoteClient:authenticated]);
    }];
}

-(MSOneNoteApiClient*) getOneNoteClient: (BOOL) authenticated{
    
    AuthenticationController* authenticationController = [AuthenticationController getInstance];
    NSString* hostName = @"https://www.onenote.com/api/beta/";
    
    if(authenticated){
        return[[ MSOneNoteApiClient alloc] initWithUrl:hostName dependencyResolver:[authenticationController getLiveSDKDependencyResolver]];
    }
    else{
        return nil;
    }
}

@end