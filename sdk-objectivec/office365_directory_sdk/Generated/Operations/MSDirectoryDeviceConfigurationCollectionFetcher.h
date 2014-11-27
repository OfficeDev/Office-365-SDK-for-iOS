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
#import "MSDirectoryDeviceConfiguration.h"
#import "MSDirectoryDeviceConfigurationFetcher.h"

/**
* The header for type MSDirectoryDeviceConfigurationCollectionFetcher.
*/

@protocol MSDirectoryDeviceConfigurationCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSDirectoryDeviceConfiguration> *deviceConfigurations, NSError *error))callback;
-(MSDirectoryDeviceConfigurationFetcher*)select : (NSString*) params;
-(MSDirectoryDeviceConfigurationFetcher*)filter : (NSString*) params;
-(MSDirectoryDeviceConfigurationFetcher*)top : (int) value;
-(MSDirectoryDeviceConfigurationFetcher*)skip : (int) value;
-(MSDirectoryDeviceConfigurationFetcher*)expand : (NSString*) value;
-(MSDirectoryDeviceConfigurationFetcher*)orderBy : (NSString*) params;

@end

@interface MSDirectoryDeviceConfigurationCollectionFetcher : MSODataCollectionFetcher<MSDirectoryDeviceConfigurationCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addDeviceConfiguration:(MSDirectoryDeviceConfiguration* )entity withCallback:(void (^)(MSDirectoryDeviceConfiguration *deviceConfiguration, NSError *e))callback;

-(MSDirectoryDeviceConfigurationFetcher*)getById:(NSString *)Id;

@end