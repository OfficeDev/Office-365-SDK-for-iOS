/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "BaseController.h"
#import "AuthenticationController.h"

@implementation BaseController

+(void)getClient : (void (^) (MSSharePointClient *))callback{
    
    AuthenticationController *authenticationController = [AuthenticationController getInstance];
    NSString *hostName = @"https://msopentechtest01-my.sharepoint.com";
    
    [authenticationController initialize:hostName :true completionHandler:^(bool authenticated) {
        
        if (authenticated) {
            
            callback([[MSSharePointClient alloc] initWithUrl:[hostName stringByAppendingString:@"/_api/v1.0/me"] dependencyResolver:[authenticationController getDependencyResolver]]);
        }
        else {
            
            NSLog(@"Error in the authentication");
        }
    }];
}

+ (UIActivityIndicatorView*)getSpinner : (UIView*)view {
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(135,140,50,50)];
    
    spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [view addSubview:spinner];
    spinner.hidesWhenStopped = YES;
    
    [spinner startAnimating];
    return spinner;
}

@end