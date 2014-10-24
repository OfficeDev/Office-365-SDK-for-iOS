/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import <Foundation/Foundation.h>
#import "MSProtocols.h"


/**
* The header for type AssignedPlan.
*/

@interface MSAssignedPlan : NSObject
@property NSString *$$__ODataType;
@property NSDate *assignedTimestamp;
@property NSString *capabilityStatus;
@property NSString *service;
@property NSString *servicePlanId;

@end