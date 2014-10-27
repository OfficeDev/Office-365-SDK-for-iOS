/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryDeviceConfiguration.h"
#import "MSDirectoryODataCollectionFetcher.h"
#import "MSDirectoryDeviceConfigurationFetcher.h"

/**
* The header for type MSDirectoryDeviceConfigurationCollectionFetcher.
*/

@protocol MSDirectoryDeviceConfigurationCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSDirectoryDeviceConfiguration> *deviceConfigurations, NSError *error))callback;

@end

@interface MSDirectoryDeviceConfigurationCollectionFetcher : MSDirectoryODataCollectionFetcher<MSDirectoryDeviceConfigurationCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSDirectoryDeviceConfiguration* )entity :(void (^)(MSDirectoryDeviceConfiguration *deviceConfiguration, NSError *e))callback;

-(MSDirectoryDeviceConfigurationFetcher*)getById:(NSString *)Id;

@end
