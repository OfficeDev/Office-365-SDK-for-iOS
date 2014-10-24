/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"
#import "MSDeviceOperations.h"
#import "MSDevice.h"
@class MSDirectoryObjectCollectionFetcher;
@class MSDirectoryObjectCollectionFetcher;

/**
* The header for type MSDeviceFetcher.
*/

@protocol MSDeviceFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSDevice* device, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSDevice*, NSError * error))callback;
@end

@interface MSDeviceFetcher : MSODataEntityFetcher<MSDeviceFetcher>

-(MSDeviceOperations*) getOperations;
-(MSDirectoryObjectCollectionFetcher*) getregisteredOwners;
-(MSDirectoryObjectCollectionFetcher*) getregisteredUsers;
	
@end