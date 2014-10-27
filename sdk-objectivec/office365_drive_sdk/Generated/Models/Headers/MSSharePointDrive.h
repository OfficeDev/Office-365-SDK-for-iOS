/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSSharePointIdentity;
@class MSSharePointDriveQuota;

#import <Foundation/Foundation.h>
#import "MSSharePointProtocols.h"


/**
* The header for type Drive.
*/

@interface MSSharePointDrive : NSObject
@property NSString *$$__ODataType;
@property NSString *id;
@property MSSharePointIdentity *owner;
@property MSSharePointDriveQuota *quota;

@end