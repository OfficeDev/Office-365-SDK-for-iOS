/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "AuthenticationController.h"

@implementation AuthenticationController

ADAuthenticationContext* authContext;
ADALDependencyResolver* adalDependencyResolver;

NSString *redirectUriString;
NSString *authority;
NSString *clientId;

static AuthenticationController* INSTANCE;

+(id) getInstance{
    
    @synchronized(self) {
        if (INSTANCE == nil) {
            INSTANCE = [[AuthenticationController alloc] init];
        }
    }
    
    return INSTANCE;
}

-(void) initializeWithResourceId:(NSString *)resourceId completionHandler:(void (^) (bool authenticated))completionBlock {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    redirectUriString = [userDefaults stringForKey: @"RedirectUrl"];
    authority =         [userDefaults stringForKey: @"AuthorityUrl"];
    clientId =          [userDefaults stringForKey: @"ClientId"];
    
    NSURL *redirectUri = [NSURL URLWithString:redirectUriString];
    ADAuthenticationError *error;
    authContext = [ADAuthenticationContext authenticationContextWithAuthority:authority error:&error];

    [authContext acquireTokenWithResource:resourceId
                                 clientId:clientId
                              redirectUri:redirectUri
                          completionBlock:^(ADAuthenticationResult  *result) {
                              
                              if (AD_SUCCEEDED != result.status){
                                  [[self getDependencyResolver].logger logMessage:result.error.errorDetails withLevel:LOG_LEVEL_ERROR];
                                  
                                  completionBlock(false);
                              } else {
                                  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                                  [userDefaults setObject:result.tokenCacheStoreItem.userInformation.userId forKey:@"LoggedInUser"];
                                  [userDefaults synchronize];
                                  
                                  adalDependencyResolver = [[ADALDependencyResolver alloc]
                                                            initWithContext:authContext
                                                              resourceId:resourceId
                                                                clientId:clientId
                                                             redirectUri:redirectUri];
                                  completionBlock(true);
                              }
                          }];
    
}

-(ADALDependencyResolver *) getDependencyResolver{
    return adalDependencyResolver;
}

-(void)clearCredentials{
    id<ADTokenCacheStoring> cache = [ADAuthenticationSettings sharedInstance].defaultTokenCacheStore;
    ADAuthenticationError * error;
    
    if ([[cache allItemsWithError:&error] count] > 0)
        [cache removeAllWithError:&error];
    
}

@end