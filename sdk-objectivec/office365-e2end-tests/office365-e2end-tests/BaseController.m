//
//  BaseController.m
//  office365-e2end-tests
//
//  Created by Lagash on 10/20/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import "BaseController.h"
#import "LogInController.h"

@implementation BaseController

-(void)getMailClient : (void (^) (MSOEntityContainerClient* ))callback{
    
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
@end
