/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "ADALDependencyResolver.h"
#import "MSODataCredentials.h"
#import "MSODataOAuthCredentials.h"
#import "ADAuthenticationResult.h"
#import "ADAuthenticationContext.h"

@interface ADALDependencyResolver()

@property (strong, atomic, readonly) ADAuthenticationContext *context;
@property (strong, atomic, readonly) NSString *clientId;
@property (strong, atomic, readonly) NSURL *redirectUri;

@end

@implementation ADALDependencyResolver

- (instancetype)initWithContext:(ADAuthenticationContext *)context
                     resourceId:(NSString *)resourceId
                       clientId:(NSString *)clientId
                    redirectUri:(NSURL *)redirectUri {
    
    if (self = [super init]) {
    
        _clientId = clientId;
        _context = context;
        _resourceId = resourceId;
        _redirectUri = redirectUri;
    }
    
    return self;
}

- (id<MSODataCredentials>)credentials {
    
    __block MSODataOAuthCredentials *credentials;
    
    dispatch_semaphore_t sem = dispatch_semaphore_create(0);
    
    [self.context acquireTokenSilentWithResource:self.resourceId
                                        clientId:self.clientId
                                     redirectUri:self.redirectUri
                                 completionBlock:^(ADAuthenticationResult *result) {
         
         credentials = [[MSODataOAuthCredentials alloc] init];
         credentials.token = result.accessToken;
         
         dispatch_semaphore_signal(sem);
     }];
    
    dispatch_semaphore_wait(sem, 10);
    
    return credentials;
}

@end