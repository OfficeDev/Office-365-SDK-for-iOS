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

@class MSGraphServiceDeviceConfigurationOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceDeviceConfigurationFetcher.
*/


@protocol MSGraphServiceDeviceConfigurationFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSGraphServiceDeviceConfiguration* deviceConfiguration, MSODataException *error))callback;
-(NSURLSessionTask*) updateDeviceConfiguration:(id)entity withCallback:(void (^)(MSGraphServiceDeviceConfiguration*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteDeviceConfiguration:(void (^)(int status, MSODataException * error))callback;
-(id<MSGraphServiceDeviceConfigurationFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceDeviceConfigurationFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSGraphServiceDeviceConfigurationFetcher>)select : (NSString*) params;
-(id<MSGraphServiceDeviceConfigurationFetcher>)expand : (NSString*) value;

@required
-(MSGraphServiceDeviceConfigurationOperations*) getOperations;
@end

@interface MSGraphServiceDeviceConfigurationFetcher : MSODataEntityFetcher<MSGraphServiceDeviceConfigurationFetcher>

@end