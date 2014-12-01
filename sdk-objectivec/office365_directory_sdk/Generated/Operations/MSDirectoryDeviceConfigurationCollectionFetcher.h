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
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSDirectoryDeviceConfiguration> *deviceConfigurations, MSODataException *error))callback;

-(id<MSDirectoryDeviceConfigurationCollectionFetcher>)select : (NSString*) params;
-(id<MSDirectoryDeviceConfigurationCollectionFetcher>)filter : (NSString*) params;
-(id<MSDirectoryDeviceConfigurationCollectionFetcher>)top : (int) value;
-(id<MSDirectoryDeviceConfigurationCollectionFetcher>)skip : (int) value;
-(id<MSDirectoryDeviceConfigurationCollectionFetcher>)expand : (NSString*) value;
-(id<MSDirectoryDeviceConfigurationCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSDirectoryDeviceConfigurationCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSDirectoryDeviceConfigurationCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
@end

@interface MSDirectoryDeviceConfigurationCollectionFetcher : MSODataCollectionFetcher<MSDirectoryDeviceConfigurationCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSDirectoryDeviceConfigurationFetcher*)getById:(NSString *)Id;
-(NSURLSessionDataTask*)addDeviceConfiguration:(MSDirectoryDeviceConfiguration* )entity withCallback:(void (^)(MSDirectoryDeviceConfiguration *deviceConfiguration, MSODataException *e))callback;

@end