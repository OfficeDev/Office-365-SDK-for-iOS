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
    
    [loginController getTokenWith : @"https://outlook.office365.com" :true completionHandler:^(NSString *token) {
        
        MSODataDefaultDependencyResolver* resolver = [MSODataDefaultDependencyResolver alloc];
        MSODataOAuthCredentials* credentials = [MSODataOAuthCredentials alloc];
        [credentials addToken:token];
        
        MSODataCredentialsImpl* credentialsImpl = [MSODataCredentialsImpl alloc];
        
        [credentialsImpl setCredentials:credentials];
        [resolver setCredentialsFactory:credentialsImpl];
        [[resolver getLogger] log:@"Going to call client API" :(MSODataLogLevel *)INFO];
        
        callback([[MSOutlookClient alloc] initWithUrl:@"https://outlook.office365.com/api/v1.0" dependencyResolver:resolver]);
    }];
}
@end