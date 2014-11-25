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
#import "MSODirectoryDevice.h"
#import "MSODirectoryDeviceFetcher.h"

/**
* The header for type MSODirectoryDeviceCollectionFetcher.
*/

@protocol MSODirectoryDeviceCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSODirectoryDevice> *devices, NSError *error))callback;

@end

@interface MSODirectoryDeviceCollectionFetcher : MSODataCollectionFetcher<MSODirectoryDeviceCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSODirectoryDevice* )entity withCallback:(void (^)(MSODirectoryDevice *device, NSError *e))callback;

-(MSODirectoryDeviceFetcher*)getById:(NSString *)Id;

@end