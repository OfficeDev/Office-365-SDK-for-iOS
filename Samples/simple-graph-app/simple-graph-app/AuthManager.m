/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "AuthManager.h"

#import <ADALiOS/ADAuthenticationSettings.h>
#import <ADALiOS/ADAuthenticationError.h>
#import <ADALiOS/ADTokenCacheStoring.h>
#import <ADALiOS/ADAuthenticationResult.h>

@interface AuthManager ()

@property (strong, nonatomic, readwrite)ADALDependencyResolver *dependencyResolver;
@property (strong, nonatomic, readonly)NSDictionary *settings;

@end

@implementation AuthManager

- (instancetype)init {
    if (self = [super init]) {
        _dependencyResolver = [[ADALDependencyResolver alloc] initWithPlist];
    }
    return self;
}

- (void)clearCredentials {
    id<ADTokenCacheStoring> cache = [ADAuthenticationSettings sharedInstance].defaultTokenCacheStore;
    ADAuthenticationError *error;
    
    if ([cache allItemsWithError:&error].count > 0)
        [cache removeAllWithError:&error];
    
}

static AuthManager *INSTANCE;

+ (AuthManager *)instance {
    
    @synchronized(self) {
        if (INSTANCE == nil) {
            INSTANCE = [[AuthManager alloc] init];
        }
    }
    
    return INSTANCE;
}

@end