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
-(NSURLSessionDataTask *)read:(void (^)(MSDirectoryDeviceConfiguration* deviceConfiguration, MSODataException *error))callback;
-(NSURLSessionDataTask*) updateDeviceConfiguration:(id)entity withCallback:(void (^)(MSDirectoryDeviceConfiguration*, MSODataException * error))callback;
-(NSURLSessionDataTask*) deleteDeviceConfiguration:(void (^)(int status, MSODataException * error))callback;
-(id<MSDirectoryDeviceConfigurationFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSDirectoryDeviceConfigurationFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@end

@interface MSDirectoryDeviceConfigurationFetcher : MSODataEntityFetcher<MSDirectoryDeviceConfigurationFetcher>

-(MSDirectoryDeviceConfigurationOperations*) getOperations;

	
@end