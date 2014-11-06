/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "BaseController.h"
#import "LogInController.h"

@implementation BaseController

+(void)getClient : (void (^) (MSSharePointClient* ))callback{
    
    LogInController* loginController = [[LogInController alloc] init];
    NSString* hostName = @"https://teeudev1-my.sharepoint.com";
    
    [loginController getTokenWith : hostName :true completionHandler:^(NSString *token) {
    
        MSDefaultDependencyResolver* resolver = [MSDefaultDependencyResolver alloc];
        MSOAuthCredentials* credentials = [MSOAuthCredentials alloc];
        [credentials addToken: token];
        
        MSCredentialsImpl* credentialsImpl = [MSCredentialsImpl alloc];
        
        [credentialsImpl setCredentials:credentials];
        [resolver setCredentialsFactory:credentialsImpl];
        
        callback([[MSSharePointClient alloc] initWithUrl:[hostName stringByAppendingString:@"/_api/v1.0/me"] dependencyResolver:resolver]);
    }];
}

+(UIActivityIndicatorView*)getSpinner : (UIView*)view{
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(135,140,50,50)];
    spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [view addSubview:spinner];
    spinner.hidesWhenStopped = YES;
    
    [spinner startAnimating];
    return spinner;
}

@end