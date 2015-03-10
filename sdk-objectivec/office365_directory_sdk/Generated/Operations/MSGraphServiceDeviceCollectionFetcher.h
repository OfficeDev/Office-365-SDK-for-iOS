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

@class MSGraphServiceDeviceFetcher;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceDeviceCollectionFetcher.
*/

@protocol MSGraphServiceDeviceCollectionFetcher<MSODataCollectionFetcher>

@optional
-(NSURLSessionTask*)read:(void (^)(NSArray<MSGraphServiceDevice> *devices, MSODataException *error))callback;

-(id<MSGraphServiceDeviceCollectionFetcher>)select : (NSString*) params;
-(id<MSGraphServiceDeviceCollectionFetcher>)filter : (NSString*) params;
-(id<MSGraphServiceDeviceCollectionFetcher>)top : (int) value;
-(id<MSGraphServiceDeviceCollectionFetcher>)skip : (int) value;
-(id<MSGraphServiceDeviceCollectionFetcher>)expand : (NSString*) value;
-(id<MSGraphServiceDeviceCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSGraphServiceDeviceCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceDeviceCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@required

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSGraphServiceDeviceFetcher*)getById:(NSString *)Id;
-(NSURLSessionTask*)addDevice:(MSGraphServiceDevice* )entity withCallback:(void (^)(MSGraphServiceDevice *device, MSODataException *e))callback;

@end

@interface MSGraphServiceDeviceCollectionFetcher : MSODataCollectionFetcher<MSGraphServiceDeviceCollectionFetcher>

@end