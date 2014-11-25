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
#import "MSODirectoryDeviceOperations.h"
#import "MSODirectoryDevice.h"
@class MSODirectoryDirectoryObjectCollectionFetcher;
@class MSODirectoryDirectoryObjectCollectionFetcher;


/**
* The header for type MSODirectoryDeviceFetcher.
*/

@protocol MSODirectoryDeviceFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSODirectoryDevice* device, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSODirectoryDevice*, NSError * error))callback;
@end

@interface MSODirectoryDeviceFetcher : MSODataEntityFetcher<MSODirectoryDeviceFetcher>

-(MSODirectoryDeviceOperations*) getOperations;

-(MSODirectoryDirectoryObjectCollectionFetcher*) getregisteredOwners;

-(MSODirectoryDirectoryObjectCollectionFetcher*) getregisteredUsers;

	
@end