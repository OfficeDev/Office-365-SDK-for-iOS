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
#import "MSDirectoryDeviceOperations.h"
#import "MSDirectoryDevice.h"
@class MSDirectoryDirectoryObjectCollectionFetcher;
@class MSDirectoryDirectoryObjectCollectionFetcher;


/**
* The header for type MSDirectoryDeviceFetcher.
*/

@protocol MSDirectoryDeviceFetcher

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSDirectoryDevice* device, MSODataException *error))callback;
-(NSURLSessionDataTask*) updateDevice:(id)entity withCallback:(void (^)(MSDirectoryDevice*, MSODataException * error))callback;
-(NSURLSessionDataTask*) deleteDevice:(void (^)(int status, MSODataException * error))callback;
-(id<MSDirectoryDeviceFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSDirectoryDeviceFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@end

@interface MSDirectoryDeviceFetcher : MSODataEntityFetcher<MSDirectoryDeviceFetcher>

-(MSDirectoryDeviceOperations*) getOperations;

-(MSDirectoryDirectoryObjectCollectionFetcher*) getregisteredOwners;

-(MSDirectoryDirectoryObjectCollectionFetcher*) getregisteredUsers;

	
@end