/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import <Foundation/Foundation.h>
#import "MSProtocols.h"


/**
* The header for type ProvisioningError.
*/

@interface MSProvisioningError : NSObject
@property NSString *$$__ODataType;
@property NSString *errorDetail;
@property bool resolved;
@property NSString *service;
@property NSDate *timestamp;

@end