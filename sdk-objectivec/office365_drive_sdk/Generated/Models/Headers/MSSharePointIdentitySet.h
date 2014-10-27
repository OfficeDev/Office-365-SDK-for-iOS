/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSSharePointIdentity;

#import <Foundation/Foundation.h>
#import "MSSharePointProtocols.h"


/**
* The header for type IdentitySet.
*/

@interface MSSharePointIdentitySet : NSObject

@property NSString *$$__ODataType;
@property MSSharePointIdentity *application;
@property MSSharePointIdentity *user;

@end