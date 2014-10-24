/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDevice.h"
#import "MSODataCollectionFetcher.h"
#import "MSDeviceFetcher.h"

/**
* The header for type MSDeviceCollectionFetcher.
*/

@protocol MSDeviceCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSDevice> *devices, NSError *error))callback;

@end

@interface MSDeviceCollectionFetcher : MSODataCollectionFetcher<MSDeviceCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSDevice* )entity :(void (^)(MSDevice *device, NSError *e))callback;

-(MSDeviceFetcher*)getById:(NSString *)Id;

@end
