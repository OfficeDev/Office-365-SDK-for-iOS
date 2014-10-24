/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDeviceConfiguration.h"
#import "MSODataCollectionFetcher.h"
#import "MSDeviceConfigurationFetcher.h"

/**
* The header for type MSDeviceConfigurationCollectionFetcher.
*/

@protocol MSDeviceConfigurationCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSDeviceConfiguration> *deviceConfigurations, NSError *error))callback;

@end

@interface MSDeviceConfigurationCollectionFetcher : MSODataCollectionFetcher<MSDeviceConfigurationCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSDeviceConfiguration* )entity :(void (^)(MSDeviceConfiguration *deviceConfiguration, NSError *e))callback;

-(MSDeviceConfigurationFetcher*)getById:(NSString *)Id;

@end
