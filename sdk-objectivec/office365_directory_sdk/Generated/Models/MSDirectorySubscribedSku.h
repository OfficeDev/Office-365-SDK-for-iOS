/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 *
 * Warning: This code was generated automatically. Edits will be overwritten.
 * To make changes to this code, please make changes to the generation framework itself:
 * https://github.com/MSOpenTech/odata-codegen
 *******************************************************************************/

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