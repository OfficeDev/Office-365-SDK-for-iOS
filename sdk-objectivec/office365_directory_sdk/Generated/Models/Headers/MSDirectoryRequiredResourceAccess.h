/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSDirectoryResourceAccess;

#import <Foundation/Foundation.h>
#import "MSDirectoryProtocols.h"


/**
* The header for type RequiredResourceAccess.
*/

@interface MSDirectoryRequiredResourceAccess : NSObject

@property NSString *$$__ODataType;
@property NSString *resourceAppId;
@property NSMutableArray<MSDirectoryResourceAccess> *resourceAccess;

@end