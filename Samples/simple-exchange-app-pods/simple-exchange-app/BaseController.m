/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "BaseController.h"
#import "LogInController.h"

@interface BaseController()

@property NSString *hostname;

@end

@implementation BaseController

-(void)getClient : (void (^) (MSOutlookClient* ))callback{
    
    _hostname = @"https://outlook.office365.com/";
    // _hostname = @"https://sdfpilot.outlook.com/";
    
    LogInController* loginController = [[LogInController alloc] init];
    
    [loginController getTokenWith:_hostname :true completionHandler:^(NSString *token) {
        
        MSDefaultDependencyResolver* resolver = [MSDefaultDependencyResolver alloc];
        MSOAuthCredentials* credentials = [MSOAuthCredentials alloc];
        [credentials addToken:token];
        
        MSCredentialsImpl* credentialsImpl = [MSCredentialsImpl alloc];
        
        [credentialsImpl setCredentials:credentials];
        [resolver setCredentialsFactory:credentialsImpl];
        [[resolver getLogger] log:@"Going to call client API" :(MSLogLevel *)INFO];
        
        callback([[MSOutlookClient alloc] initWitUrl:[_hostname stringByAppendingString:@"api/v1.0"] dependencyResolver:resolver]);
    }];
}
@end