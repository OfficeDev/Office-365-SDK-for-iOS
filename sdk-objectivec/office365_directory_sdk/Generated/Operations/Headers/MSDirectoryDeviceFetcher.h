/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryODataEntityFetcher.h"
#import "MSDirectoryDeviceOperations.h"
#import "MSDirectoryDevice.h"
@class MSDirectoryDirectoryObjectCollectionFetcher;
@class MSDirectoryDirectoryObjectCollectionFetcher;

/**
* The header for type MSDirectoryDeviceFetcher.
*/

@protocol MSDirectoryDeviceFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSDirectoryDevice* device, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSDirectoryDevice*, NSError * error))callback;
@end

@interface MSDirectoryDeviceFetcher : MSDirectoryODataEntityFetcher<MSDirectoryDeviceFetcher>

-(MSDirectoryDeviceOperations*) getOperations;
-(MSDirectoryDirectoryObjectCollectionFetcher*) getregisteredOwners;
-(MSDirectoryDirectoryObjectCollectionFetcher*) getregisteredUsers;
	
@end