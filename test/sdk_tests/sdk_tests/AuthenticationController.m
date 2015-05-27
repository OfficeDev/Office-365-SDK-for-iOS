/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "AuthenticationController.h"

@implementation AuthenticationController

ADAuthenticationContext *authContext;
ADALDependencyResolver* DependencyResolver;
LiveConnectClient *liveClient;

NSString *redirectUriString;
NSString *authority;
NSString *clientId;
NSString *token;
NSString *liveClientId;
NSString *scopesString;
static AuthenticationController* INSTANCE;

-(id)init{
    self = [super init];

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

    redirectUriString = [userDefaults objectForKey:@"RedirectUrl"];
    authority = [userDefaults objectForKey:@"AuthorityUrl"];
    clientId =[userDefaults objectForKey: @"CliendId"];
    token = [NSString alloc];
    liveClientId = @"00000000441364FF";
    scopesString = @"wl.signin wl.basic wl.offline_access wl.skydrive_update wl.contacts_create";

    NSArray *scopes = [scopesString componentsSeparatedByString:@" "];

    liveClient = [[LiveConnectClient alloc] initWithClientId:liveClientId
                                                      scopes:scopes
                                                    delegate:nil
                                                   userState:@"init"];
    return self;
}

+(id)getInstance {

    @synchronized(self) {
        if (INSTANCE == nil) {
            INSTANCE = [[AuthenticationController alloc] init];
        }
    }

    return INSTANCE;
}

-(void)initialize:(NSString *)resourceId :(BOOL)clearCache completionHandler:(void (^) (bool authenticated))completionBlock {


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
                              }
                              else{

                                  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                                  [userDefaults setObject:result.tokenCacheStoreItem.userInformation.userId forKey:@"LogInUser"];
                                  [userDefaults synchronize];

                                  DependencyResolver = [[ADALDependencyResolver alloc] initWithContext:authContext resourceId:resourceId clientId:clientId redirectUri:redirectUri];

                                  completionBlock(true);
                              }
                          }];

}

-(void) initializeWithLiveSDK :(UIViewController*)viewController completionHandler:(void (^) (bool authenticated))completionBlock{

    if(liveClient.session != nil){
        completionBlock(TRUE);
    }else{
        completionBlock(FALSE);
    }
}

- (void)authenticateWithLiveSDK:(UIViewController *)controller : (void (^)(LiveConnectSession*)) callback{

    if (!liveClient.session) {
        NSLog(@"Logging in");

        [liveClient login:controller delegate:controller userState:@"login"];

        dispatch_queue_t loginTask = dispatch_queue_create("authenticateWithLiveSDK", NULL);

        dispatch_async(loginTask, ^{

            dispatch_semaphore_t sem = dispatch_semaphore_create(0);
            dispatch_semaphore_signal(sem);

            while (liveClient.session == nil) {

                dispatch_semaphore_wait(sem, 0.1);
            }

            callback(liveClient.session);

        });
    }
}

-(ADALDependencyResolver*) getDependencyResolver{
    return DependencyResolver;
}

-(MSOrcDefaultDependencyResolver*) getLiveSDKDependencyResolver{
    MSOrcOAuthCredentials* credentials = [MSOrcOAuthCredentials alloc];
    [credentials setToken:liveClient.session.accessToken];
    MSOrcDefaultDependencyResolver* resolver = [[MSOrcDefaultDependencyResolver alloc] init];

    [resolver setCredentials:credentials];
    return resolver;
}


-(void)clearCredentials{
    id<ADTokenCacheStoring> cache = [ADAuthenticationSettings sharedInstance].defaultTokenCacheStore;
    ADAuthenticationError * error;

    if ([[cache allItemsWithError:&error] count] > 0)
        [cache removeAllWithError:&error];

}

@end
