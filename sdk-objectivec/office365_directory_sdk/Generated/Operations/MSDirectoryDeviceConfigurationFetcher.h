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

#import <office365_odata_base/office365_odata_base.h>
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

@interface MSDirectoryDeviceConfigurationFetcher : MSODataEntityFetcher<MSDirectoryDeviceConfigurationFetcher>

-(MSDirectoryDeviceConfigurationOperations*) getOperations;

	
@end