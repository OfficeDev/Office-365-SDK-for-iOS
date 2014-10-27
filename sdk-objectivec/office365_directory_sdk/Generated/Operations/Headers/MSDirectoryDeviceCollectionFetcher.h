/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryDevice.h"
#import "MSDirectoryODataCollectionFetcher.h"
#import "MSDirectoryDeviceFetcher.h"

/**
* The header for type MSDirectoryDeviceCollectionFetcher.
*/

@protocol MSDirectoryDeviceCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSDirectoryDevice> *devices, NSError *error))callback;

@end

@interface MSDirectoryDeviceCollectionFetcher : MSDirectoryODataCollectionFetcher<MSDirectoryDeviceCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSDirectoryDevice* )entity :(void (^)(MSDirectoryDevice *device, NSError *e))callback;

-(MSDirectoryDeviceFetcher*)getById:(NSString *)Id;

@end
