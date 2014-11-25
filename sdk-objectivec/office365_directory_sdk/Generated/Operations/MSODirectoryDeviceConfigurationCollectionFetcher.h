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
#import "MSODirectoryDeviceConfiguration.h"
#import "MSODirectoryDeviceConfigurationFetcher.h"

/**
* The header for type MSODirectoryDeviceConfigurationCollectionFetcher.
*/

@protocol MSODirectoryDeviceConfigurationCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSODirectoryDeviceConfiguration> *deviceConfigurations, NSError *error))callback;

@end

@interface MSODirectoryDeviceConfigurationCollectionFetcher : MSODataCollectionFetcher<MSODirectoryDeviceConfigurationCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSODirectoryDeviceConfiguration* )entity withCallback:(void (^)(MSODirectoryDeviceConfiguration *deviceConfiguration, NSError *e))callback;

-(MSODirectoryDeviceConfigurationFetcher*)getById:(NSString *)Id;

@end