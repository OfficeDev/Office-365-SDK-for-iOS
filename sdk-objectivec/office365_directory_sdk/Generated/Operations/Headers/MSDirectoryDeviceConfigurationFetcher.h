/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryODataEntityFetcher.h"
#import "MSDirectoryDeviceConfigurationOperations.h"
#import "MSDirectoryDeviceConfiguration.h"

/**
* The header for type MSDirectoryDeviceConfigurationFetcher.
*/

@protocol MSDirectoryDeviceConfigurationFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSDirectoryDeviceConfiguration* deviceConfiguration, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSDirectoryDeviceConfiguration*, NSError * error))callback;
@end

@interface MSDirectoryDeviceConfigurationFetcher : MSDirectoryODataEntityFetcher<MSDirectoryDeviceConfigurationFetcher>

-(MSDirectoryDeviceConfigurationOperations*) getOperations;
	
@end