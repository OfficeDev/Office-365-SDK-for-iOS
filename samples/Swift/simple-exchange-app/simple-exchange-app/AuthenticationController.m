/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "AuthenticationController.h"

@implementation AuthenticationController

ADAuthenticationContext *authContext;
ADALDependencyResolver* DependencyResolver;

NSString *redirectUriString;
NSString *authority;
NSString *clientId;
NSString *token;

static AuthenticationController* INSTANCE;

-(id)init{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    redirectUriString = [userDefaults objectForKey: @"RedirectUrl"];
    authority = [userDefaults objectForKey: @"AuthorityUrl"];
    clientId =[userDefaults objectForKey: @"CliendId"];
    token = [NSString alloc];
    
    return self;
}

+(id) getInstance{
    
    @synchronized(self) {
        if (INSTANCE == nil) {
            INSTANCE = [[AuthenticationController alloc] init];
        }
    }
    
    return INSTANCE;
}

-(void) initialize :(NSString *)resourceId : (BOOL) clearCache completionHandler:(void (^) (bool authenticated))completionBlock{
    
    NSURL *redirectUri = [NSURL URLWithString:redirectUriString];
    ADAuthenticationError *error;
    authContext = [ADAuthenticationContext authenticationContextWithAuthority:authority error:&error];
    
    [authContext acquireTokenWithResource:resourceId
                                 clientId:clientId
                              redirectUri:redirectUri
                          completionBlock:^(ADAuthenticationResult  *result) {
                              
                              if (AD_SUCCEEDED != result.status){
                                  [[[self getDependencyResolver] getLogger] log:result.error.errorDetails :ERROR];
                                  completionBlock(false);
                              }
                              else{
                                  
                                  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                                  [userDefaults setObject:result.tokenCacheStoreItem.userInformation.userId forKey:@"LogInUser"];
                                  [userDefaults synchronize];
                                  
                                  DependencyResolver = [[ADALDependencyResolver alloc]
                                                        initWithContext:authContext andResourceId:resourceId
                                                        andClientId:clientId andRedirectUri:redirectUri];
                                  completionBlock(true);
                              }
                          }];
}

-(ADALDependencyResolver*) getDependencyResolver{
    return DependencyResolver;
}

-(void)clearCredentials{
    id<ADTokenCacheStoring> cache = [ADAuthenticationSettings sharedInstance].defaultTokenCacheStore;
    ADAuthenticationError * error;
    
    if ([[cache allItemsWithError:&error] count] > 0)
        [cache removeAllWithError:&error];
    
}

@end