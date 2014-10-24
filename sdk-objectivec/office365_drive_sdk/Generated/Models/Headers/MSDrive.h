/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSIdentity;
@class MSDriveQuota;

#import <Foundation/Foundation.h>
#import "MSProtocols.h"


/**
* The header for type Drive.
*/

@interface MSDrive : NSObject
@property NSString *$$__ODataType;
@property NSString *id;
@property MSIdentity *owner;
@property MSDriveQuota *quota;

@end