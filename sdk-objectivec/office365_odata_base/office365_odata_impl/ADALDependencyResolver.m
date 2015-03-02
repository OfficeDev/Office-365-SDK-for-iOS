/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "ADALDependencyResolver.h"
#import "MSODataCredentials.h"
#import "MSODataOAuthCredentials.h"

@interface ADALDependencyResolver()

@property id<ADAuthenticationContext> Context;
@property NSString* ClientId;
@property NSString* ResourceId;
@property NSURL* RedirectUri;

@end

@implementation ADALDependencyResolver

-(id)initWithContext : (id<ADAuthenticationContext>) context andResourceId : (NSString*)resourceId andClientId : (NSString*) clientId andRedirectUri : (NSURL*) redirectUri{
    
    self.ClientId = clientId;
    self.Context = context;
    self.ResourceId = resourceId;
    self.RedirectUri = redirectUri;
    
    return self;
}

-(id<MSODataCredentials>)getCredentials{
    
    __block MSODataOAuthCredentials* credentials;
    
    dispatch_semaphore_t sem = dispatch_semaphore_create(0);
    
    [self.Context acquireTokenSilentWithResource:self.ResourceId clientId:self.ClientId redirectUri:self.RedirectUri completionBlock:
     ^(id<ADAuthenticationResult>result) {
         
         credentials = [MSODataOAuthCredentials alloc];
         [credentials addToken:result.accessToken];
         
         dispatch_semaphore_signal(sem);
     }];
    
    dispatch_semaphore_wait(sem, 10);
    
    return credentials;
}

-(NSString*)getResourceId{
    return self.ResourceId;
}

@end