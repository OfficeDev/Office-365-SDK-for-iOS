/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "BaseController.h"
#import "LogInController.h"


@implementation BaseController

-(void)getClient : (void (^) (MSOutlookClient* ))callback{
    
    LogInController* loginController = [[LogInController alloc] init];
    
    [loginController getTokenWith : @"https://sdfpilot.outlook.com" :true completionHandler:^(NSString *token) {
        
        MSDefaultDependencyResolver* resolver = [MSDefaultDependencyResolver alloc];
        MSOAuthCredentials* credentials = [MSOAuthCredentials alloc];
        [credentials addToken:token];
        
        MSCredentialsImpl* credentialsImpl = [MSCredentialsImpl alloc];
        
        [credentialsImpl setCredentials:credentials];
        [resolver setCredentialsFactory:credentialsImpl];
        [[resolver getLogger] log:@"Going to call client API" :(MSLogLevel *)INFO];
        
        callback([[MSOutlookClient alloc] initWitUrl:@"https://sdfpilot.outlook.com/api/v1.0" dependencyResolver:resolver]);
    }];
}
@end