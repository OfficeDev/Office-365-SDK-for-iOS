/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSResourceAccess;

#import <Foundation/Foundation.h>
#import "MSProtocols.h"


/**
* The header for type RequiredResourceAccess.
*/

@interface MSRequiredResourceAccess : NSObject
@property NSString *$$__ODataType;
@property NSString *resourceAppId;
@property NSMutableArray<MSResourceAccess> *resourceAccess;

@end