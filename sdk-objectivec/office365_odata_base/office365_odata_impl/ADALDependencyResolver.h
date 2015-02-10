/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "MSODataDefaultDependencyResolver.h"

@protocol ADAuthenticationResult

@property NSString* accessToken;

@end

@protocol ADAuthenticationContext

-(void) acquireTokenSilentWithResource: (NSString*) resource
                              clientId: (NSString*) clientId
                           redirectUri: (NSURL*) redirectUri
                       completionBlock: (id<ADAuthenticationResult>) completionBlock;

@end

@interface ADALDependencyResolver : MSODataDefaultDependencyResolver

-(id)initWithContext : (id<ADAuthenticationContext>) context andResourceId : (NSString*)resourceId andClientId : (NSString*) clientId andRedirectUri : (NSURL*) redirectUri;
-(NSString*)getResourceId;

@end