/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSDirectoryLicenseUnitsDetail;
@class MSDirectoryServicePlanInfo;

#import <Foundation/Foundation.h>
#import "MSDirectoryProtocols.h"


/**
* The header for type SubscribedSku.
*/

@interface MSDirectorySubscribedSku : NSObject
@property NSString *$$__ODataType;
@property NSString *capabilityStatus;
@property int consumedUnits;
@property NSString *objectId;
@property MSDirectoryLicenseUnitsDetail *prepaidUnits;
@property NSMutableArray<MSDirectoryServicePlanInfo> *servicePlans;
@property NSString *skuId;
@property NSString *skuPartNumber;

@end