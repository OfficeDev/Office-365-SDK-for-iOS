/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"
#import "MSDeviceConfigurationOperations.h"
#import "MSDeviceConfiguration.h"

/**
* The header for type MSDeviceConfigurationFetcher.
*/

@protocol MSDeviceConfigurationFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSDeviceConfiguration* deviceConfiguration, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSDeviceConfiguration*, NSError * error))callback;
@end

@interface MSDeviceConfigurationFetcher : MSODataEntityFetcher<MSDeviceConfigurationFetcher>

-(MSDeviceConfigurationOperations*) getOperations;
	
@end