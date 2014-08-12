//
//  LoginClient.m
//  office365-base-sdk
//
//  Created by Lagash on 8/7/14.
//  Copyright (c) 2014 Lagash. All rights reserved.
//

#import "LoginClient.h"
#import <ADALiOS/ADAuthenticationContext.h>
#import <ADALiOS/ADAuthenticationParameters.h>
#import <ADALiOS/ADAuthenticationSettings.h>
#import <ADALiOS/ADLogger.h>
#import <ADALiOS/ADInstanceDiscovery.h>

@implementation LoginClient
    NSString *clientId;

    ADAuthenticationContext* authContext;
    NSString* adalAuthority;
    NSString* redirectUriString;
    NSString* resourceId;
    NSString* token;

    - (id)initWithParameters: (NSString *)cliId : (NSString *)retUrl : (NSString *)resId : (NSString *)authority
    {
        clientId = [NSString alloc];
        redirectUriString = [NSString alloc];
        resourceId = [NSString alloc];
        adalAuthority = [NSString alloc];
        token = [NSString alloc];

        clientId = cliId;
        redirectUriString = retUrl;
        resourceId = resId;
        adalAuthority = authority;
        
        return self;
    }

-(void)clearCredentials : (NSError* __autoreleasing*) e {
        ADAuthenticationError* error;
        id<ADTokenCacheStoring> cache = [ADAuthenticationSettings sharedInstance].defaultTokenCacheStore;
        NSArray* allItems = [cache allItemsWithError:&error];
    
        if (error)
        {
            *e = error;
            return;
        }

        if (allItems.count > 0)
        {
            [cache removeAllWithError:&error];
            if (error)
            {
                *e = error;
            }
        }
    
        NSHTTPCookieStorage* cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
        NSArray* cookies = cookieStorage.cookies;
        if (cookies.count)
        {
            for(NSHTTPCookie* cookie in cookies)
            {
                [cookieStorage deleteCookie:cookie];
            }
        }
    }

    -(void) login: (BOOL) clearCache completionHandler:(void (^) (NSString* token, NSError * error))completionBlock;{
        NSError *error ;
        if(clearCache)
            [self clearCredentials: &error];
        
        if([self getCacheToken : resourceId completionHandler:completionBlock]) return;
        
        [self getToken:clearCache completionHandler:^(NSString *t, NSError *e){
            token = t;
            completionBlock(t,e);
        }];
    }


    -(void) getToken : (BOOL) clearCache completionHandler:(void (^) (NSString*, NSError *e))completionBlock;
    {
        ADAuthenticationError *error;
        authContext = [ADAuthenticationContext authenticationContextWithAuthority:adalAuthority
                                                                            error:&error];
        
        NSURL *redirectUri = [NSURL URLWithString:redirectUriString];
        
        if(clearCache){
            [authContext.tokenCacheStore removeAllWithError: &error];
        }
        
        [authContext acquireTokenWithResource:resourceId
                                     clientId:clientId
                                  redirectUri:redirectUri
                              completionBlock:^(ADAuthenticationResult *result) {
                                  if (AD_SUCCEEDED != result.status){
                                      completionBlock(nil, result.error);
                                  }
                                  else{
                                      completionBlock(result.accessToken, nil);
                                  }
                              }];
    }


    -(BOOL)getCacheToken : (NSString *)resourceId  completionHandler:(void (^) (NSString *t, NSError *e))completionBlock {
        ADAuthenticationError * error;
        id<ADTokenCacheStoring> cache = [ADAuthenticationSettings sharedInstance].defaultTokenCacheStore;
        NSArray *array = [cache allItemsWithError:&error];
        
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
            
            completionBlock(cacheItem.accessToken, error);
            
            return true;
        }
    }

    -(BOOL)refreshToken : (NSString*)resourceId  completionHandler:(void (^) (NSString *, NSError *e))completionBlock{
        ADAuthenticationError *error;
        authContext = [ADAuthenticationContext authenticationContextWithAuthority:adalAuthority error:&error];
        
        ADTokenCacheStoreKey *key = [ADTokenCacheStoreKey keyWithAuthority:adalAuthority resource:nil clientId:clientId error:&error];
        
        if (!key)
        {
           return false;
        }
        
        id<ADTokenCacheStoring> cache = authContext.tokenCacheStore;
        ADTokenCacheStoreItem *item = [cache getItemWithKey:key userId:nil error:&error];
        
        if (!item)
        {
            return false;
        }
        
        [authContext acquireTokenByRefreshToken:item.refreshToken
                                       clientId:clientId
                                       resource:resourceId
                                completionBlock:^(ADAuthenticationResult *result)
         {
             completionBlock(result.tokenCacheStoreItem.accessToken, error);
         }];
        
        return true;
    }
@end