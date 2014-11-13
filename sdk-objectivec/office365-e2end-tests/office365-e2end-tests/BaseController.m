/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "BaseController.h"
#import "LogInController.h"

@implementation BaseController

-(void)getMailClient : (void (^) (MSOutlookClient* ))callback{
    
    LogInController* loginController = [[LogInController alloc] init];
    
    [loginController getTokenWith : @"https://outlook.office365.com/" :true completionHandler:^(NSString *token) {
    
        MSDefaultDependencyResolver* resolver = [MSDefaultDependencyResolver alloc];
        MSOAuthCredentials* credentials = [MSOAuthCredentials alloc];
        [credentials addToken:token];
        MSCredentialsImpl* credentialsImpl = [MSCredentialsImpl alloc];
        
        [credentialsImpl setCredentials:credentials];
        [resolver setCredentialsFactory:credentialsImpl];
    
        callback([[MSOutlookClient alloc] initWithUrl:@"https://outlook.office365.com/api/v1.0" dependencyResolver:resolver]);
    }];
}

-(void) getSharePointClient:(void (^)(MSSharePointClient *))callback{
    LogInController* loginController = [[LogInController alloc] init];
    
    [loginController getTokenWith : @"https://teeudev1-my.sharepoint.com/" :true completionHandler:^(NSString *token) {
        
        MSDefaultDependencyResolver* resolver = [MSDefaultDependencyResolver alloc];
        MSOAuthCredentials* credentials = [MSOAuthCredentials alloc];
        [credentials addToken:token];
        MSCredentialsImpl* credentialsImpl = [MSCredentialsImpl alloc];
        
        [credentialsImpl setCredentials:credentials];
        [resolver setCredentialsFactory:credentialsImpl];
        
        callback([[MSSharePointClient alloc] initWithUrl:@"https://teeudev1-my.sharepoint.com/_api/v1.0/me" dependencyResolver:resolver]);
    }];
}
@end
