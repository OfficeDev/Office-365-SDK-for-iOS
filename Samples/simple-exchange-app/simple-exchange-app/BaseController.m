/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "BaseController.h"
#import "LogInController.h"

@implementation BaseController

+(void)getClient : (void (^) (MSOEntityContainerClient* ))callback{
    
    LogInController* loginController = [[LogInController alloc] init];
    
    [loginController getTokenWith : @"https://sdfpilot.outlook.com" :true completionHandler:^(NSString *token) {
        
        MSODefaultDependencyResolver* resolver = [MSODefaultDependencyResolver alloc];
        MSOOAuthCredentials* credentials = [MSOOAuthCredentials alloc];
        [credentials addToken:token];
        
        MSOCredentialsImpl* credentialsImpl = [MSOCredentialsImpl alloc];
        
        [credentialsImpl setCredentials:credentials];
        [resolver setCredentialsFactory:credentialsImpl];
        
        callback([[MSOEntityContainerClient alloc] initWitUrl:@"https://sdfpilot.outlook.com/ews/odata" dependencyResolver:resolver]);
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