/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "MSODataDefaultDependencyResolver.h"

@class ADAuthenticationContext;

@interface ADALDependencyResolver : MSODataDefaultDependencyResolver

- (instancetype)initWithContext:(ADAuthenticationContext *)context
                     resourceId:(NSString *)resourceId
                       clientId:(NSString *)clientId
                    redirectUri:(NSURL *)redirectUri;

@property (strong, atomic) NSString *resourceId;

@end