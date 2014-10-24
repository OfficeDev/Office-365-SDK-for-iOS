/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSLicenseUnitsDetail;
@class MSServicePlanInfo;

#import <Foundation/Foundation.h>
#import "MSProtocols.h"


/**
* The header for type SubscribedSku.
*/

@interface MSSubscribedSku : NSObject
@property NSString *$$__ODataType;
@property NSString *capabilityStatus;
@property int consumedUnits;
@property NSString *objectId;
@property MSLicenseUnitsDetail *prepaidUnits;
@property NSMutableArray<MSServicePlanInfo> *servicePlans;
@property NSString *skuId;
@property NSString *skuPartNumber;

@end