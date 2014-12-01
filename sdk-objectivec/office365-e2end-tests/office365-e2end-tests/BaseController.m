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

        MSODataDefaultDependencyResolver *resolver = [self getDependencyResolver:token];
        callback([[MSOutlookClient alloc] initWithUrl:@"https://outlook.office365.com/api/v1.0" dependencyResolver:resolver]);
    }];
}

-(void) getSharePointClient:(void (^)(MSSharePointClient *))callback{
    LogInController* loginController = [[LogInController alloc] init];
    
    [loginController getTokenWith : @"https://teeudev1-my.sharepoint.com/" :true completionHandler:^(NSString *token) {
        
        MSODataDefaultDependencyResolver *resolver = [self getDependencyResolver:token];
        callback([[MSSharePointClient alloc] initWithUrl:@"https://teeudev1-my.sharepoint.com/_api/v1.0/me" dependencyResolver:resolver]);
    }];
}

-(void) getDiscoveryClient:(void (^)(MSDiscoveryClient *))callback{
    LogInController* loginController = [[LogInController alloc] init];
    
    [loginController getTokenWith : @"https://api.office.com/discovery/" :true completionHandler:^(NSString *token) {
        
        MSODataDefaultDependencyResolver *resolver = [self getDependencyResolver:token];
        callback([[MSDiscoveryClient alloc] initWithUrl:@"https://api.office.com/discovery/v1.0/me/" dependencyResolver:resolver]);
    }];
}

-(MSODataDefaultDependencyResolver*) getDependencyResolver: (NSString*) token{
    MSODataDefaultDependencyResolver* resolver = [MSODataDefaultDependencyResolver alloc];
    MSODataOAuthCredentials* credentials = [MSODataOAuthCredentials alloc];
    [credentials addToken:token];
    MSODataCredentialsImpl* credentialsImpl = [MSODataCredentialsImpl alloc];
    
    [credentialsImpl setCredentials:credentials];
    [resolver setCredentialsFactory:credentialsImpl];
    return resolver;
}
@end
