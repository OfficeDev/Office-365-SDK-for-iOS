/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSIdentity;

#import <Foundation/Foundation.h>
#import "MSProtocols.h"


/**
* The header for type IdentitySet.
*/

@interface MSIdentitySet : NSObject
@property NSString *$$__ODataType;
@property MSIdentity *application;
@property MSIdentity *user;

@end