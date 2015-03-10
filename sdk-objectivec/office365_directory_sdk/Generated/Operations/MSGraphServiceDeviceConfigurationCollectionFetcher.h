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

@class MSGraphServiceDeviceConfigurationFetcher;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceDeviceConfigurationCollectionFetcher.
*/

@protocol MSGraphServiceDeviceConfigurationCollectionFetcher<MSODataCollectionFetcher>

@optional
-(NSURLSessionTask*)read:(void (^)(NSArray<MSGraphServiceDeviceConfiguration> *deviceConfigurations, MSODataException *error))callback;

-(id<MSGraphServiceDeviceConfigurationCollectionFetcher>)select : (NSString*) params;
-(id<MSGraphServiceDeviceConfigurationCollectionFetcher>)filter : (NSString*) params;
-(id<MSGraphServiceDeviceConfigurationCollectionFetcher>)top : (int) value;
-(id<MSGraphServiceDeviceConfigurationCollectionFetcher>)skip : (int) value;
-(id<MSGraphServiceDeviceConfigurationCollectionFetcher>)expand : (NSString*) value;
-(id<MSGraphServiceDeviceConfigurationCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSGraphServiceDeviceConfigurationCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceDeviceConfigurationCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@required

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSGraphServiceDeviceConfigurationFetcher*)getById:(NSString *)Id;
-(NSURLSessionTask*)addDeviceConfiguration:(MSGraphServiceDeviceConfiguration* )entity withCallback:(void (^)(MSGraphServiceDeviceConfiguration *deviceConfiguration, MSODataException *e))callback;

@end

@interface MSGraphServiceDeviceConfigurationCollectionFetcher : MSODataCollectionFetcher<MSGraphServiceDeviceConfigurationCollectionFetcher>

@end