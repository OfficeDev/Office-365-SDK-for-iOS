/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "BaseController.h"
#import "AuthenticationController.h"

@implementation BaseController

+(void)getClient : (void (^) (MSOutlookClient* ))callback{
    
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
@end