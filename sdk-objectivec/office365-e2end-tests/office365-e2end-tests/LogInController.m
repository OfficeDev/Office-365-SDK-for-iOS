//
//  LogInSerivce.m
//  simple-exchange-app
//
//  Created by Gustavo on 7/17/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "LogInController.h"

@implementation LogInController

ADAuthenticationContext *authContext;
NSString *redirectUriString;
NSString *authority;
NSString *clientId;
NSString *token;

-(id)init{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    redirectUriString = [userDefaults objectForKey: @"RedirectUrl"];
    authority = [userDefaults objectForKey: @"AuthorityUrl"];
    clientId =[userDefaults objectForKey: @"CliendId"];
    
    token = [NSString alloc];
    
    return self;
}

-(void) getTokenWith :(NSString *)resourceId : (BOOL) clearCache completionHandler:(void (^) (NSString *))completionBlock;
{
    if([self getCacheToken : resourceId completionHandler:completionBlock]) return;
    
    ADAuthenticationError *error;
    authContext = [ADAuthenticationContext authenticationContextWithAuthority:authority error:&error];
    
    NSURL *redirectUri = [NSURL URLWithString:redirectUriString];
    
    //if(clearCache) [authContext.tokenCacheStore removeAll];
    
    [authContext acquireTokenWithResource:resourceId
                                 clientId:clientId
                              redirectUri:redirectUri
                          completionBlock:^(ADAuthenticationResult  *result) {
                              
                              if (AD_SUCCEEDED != result.status){
                                  [self showError:result.error.errorDetails];
                              }
                              else{
                                  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                                  [userDefaults setObject:result.tokenCacheStoreItem.userInformation.userId forKey:@"LogInUser"];
                                  [userDefaults synchronize];
                                  
                                  completionBlock(result.accessToken);
                              }
                          }];
}

-(void)showError : (NSString *) errorDetails{
    
}

-(void) setStatus: (NSString *) status
{
    dispatch_async(dispatch_get_main_queue(), ^{
        // [self.resultLabel setText:status];
    });
}

-(void)clearCredentials{
    id<ADTokenCacheStoring> cache = [ADAuthenticationSettings sharedInstance].defaultTokenCacheStore;
    
    if([cache allItemsWithError:nil].count > 0)[cache removeAllWithError:nil];
}

-(BOOL)getCacheToken : (NSString *)resourceId  completionHandler:(void (^) (NSString *))completionBlock {
    
    id<ADTokenCacheStoring> cache = [ADAuthenticationSettings sharedInstance].defaultTokenCacheStore;
    NSArray *array = [cache allItemsWithError:nil];
    
    if([array count] == 0) return false;
    
    
    ADTokenCacheStoreItem *cacheItem;
    
    for (ADTokenCacheStoreItem *item in array) {
        if([item.resource isEqualToString:resourceId]){
            cacheItem = item;
            break;
        }
    }
    
    ADUserInformation *user = cacheItem.userInformation;
    
    if(user == nil) return false;
    
    if([cacheItem isExpired]){
        return [self refreshToken:resourceId completionHandler:completionBlock];
    }
    else
    {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:user.userId forKey:@"LogInUser"];
        [userDefaults synchronize];
        
        completionBlock(cacheItem.accessToken);
        
        return true;
    }
}

-(BOOL)refreshToken : (NSString*)resourceId  completionHandler:(void (^) (NSString *))completionBlock{
    
    ADAuthenticationError *error;
    authContext = [ADAuthenticationContext authenticationContextWithAuthority:authority error:&error];
   
    ADTokenCacheStoreKey *key = [ADTokenCacheStoreKey keyWithAuthority:authority resource:nil clientId:clientId error:&error];
   
    if (!key)
    {
        [self setStatus:error.errorDetails];
        return false;
    }
   
    id<ADTokenCacheStoring> cache = authContext.tokenCacheStore;
    ADTokenCacheStoreItem *item = [cache getItemWithKey:key userId:nil error:&error];
    
    if (!item)
    {
        [self setStatus:@"Missing cache item."];
        return false;
    }
    
    [authContext acquireTokenByRefreshToken:item.refreshToken
                               clientId:clientId
                               resource:resourceId
                        completionBlock:^(ADAuthenticationResult *result)
     {
         completionBlock(result.tokenCacheStoreItem.accessToken);
     }];
    
    return true;
}

@end