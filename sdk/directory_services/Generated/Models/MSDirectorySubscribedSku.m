/*******************************************************************************
**NOTE** This code was generated by a tool and will occasionally be
overwritten. We welcome comments and issues regarding this code; they will be
addressed in the generation tool. If you wish to submit pull requests, please
do so for the templates in that tool.

This code was generated by Vipr (https://github.com/microsoft/vipr) using
the T4TemplateWriter (https://github.com/msopentech/vipr-t4templatewriter).

Copyright (c) Microsoft Open Technologies, Inc. All Rights Reserved.
Licensed under the Apache License 2.0; see LICENSE in the source repository
root for authoritative license information.﻿
******************************************************************************/

#import "MSDirectoryModels.h"

/**
* The implementation file for type MSDirectorySubscribedSku.
*/

@implementation MSDirectorySubscribedSku	

@synthesize odataType = _odataType;
@synthesize capabilityStatus = _capabilityStatus;
@synthesize consumedUnits = _consumedUnits;
@synthesize objectId = _objectId;
@synthesize prepaidUnits = _prepaidUnits;
@synthesize servicePlans = _servicePlans;
@synthesize skuId = _skuId;
@synthesize skuPartNumber = _skuPartNumber;

- (instancetype)init {

	if (self = [super init]) {

		_odataType = @"#Microsoft.DirectoryServices.SubscribedSku";
		_servicePlans = [[NSMutableArray alloc] initWithCollectionType:@"MSDirectoryServicePlanInfo"];
    }

	return self;
}

- (void)setCapabilityStatus:(NSString *) capabilityStatus {
    _capabilityStatus = capabilityStatus;
	[self valueChanged:capabilityStatus forProperty:@"capabilityStatus"];
}
    
- (void)setConsumedUnits:(int ) consumedUnits {
    _consumedUnits = consumedUnits;
    [self valueChangedForInt:consumedUnits forProperty:@"consumedUnits"];
}
    
- (void)setObjectId:(NSString *) objectId {
    _objectId = objectId;
	[self valueChanged:objectId forProperty:@"objectId"];
}
    
- (void)setPrepaidUnits:(MSDirectoryLicenseUnitsDetail *) prepaidUnits {
    _prepaidUnits = prepaidUnits;
	[self valueChanged:prepaidUnits forProperty:@"prepaidUnits"];
}
    
- (void)setServicePlans:(NSMutableArray *) servicePlans {
    _servicePlans = servicePlans;
	[self valueChanged:servicePlans forProperty:@"servicePlans"];
}
    
- (void)setSkuId:(NSString *) skuId {
    _skuId = skuId;
	[self valueChanged:skuId forProperty:@"skuId"];
}
    
- (void)setSkuPartNumber:(NSString *) skuPartNumber {
    _skuPartNumber = skuPartNumber;
	[self valueChanged:skuPartNumber forProperty:@"skuPartNumber"];
}
    
@end