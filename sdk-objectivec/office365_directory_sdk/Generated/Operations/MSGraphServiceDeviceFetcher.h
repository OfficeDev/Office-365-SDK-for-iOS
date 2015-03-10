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

@class MSGraphServiceDirectoryObjectFetcher;;
@class MSGraphServiceDirectoryObjectCollectionFetcher;;
@class MSGraphServiceDeviceOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceDeviceFetcher.
*/


@protocol MSGraphServiceDeviceFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSGraphServiceDevice* device, MSODataException *error))callback;
-(NSURLSessionTask*) updateDevice:(id)entity withCallback:(void (^)(MSGraphServiceDevice*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteDevice:(void (^)(int status, MSODataException * error))callback;
-(id<MSGraphServiceDeviceFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceDeviceFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSGraphServiceDeviceFetcher>)select : (NSString*) params;
-(id<MSGraphServiceDeviceFetcher>)expand : (NSString*) value;

@required
-(MSGraphServiceDeviceOperations*) getOperations;
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getregisteredOwners;

-(MSGraphServiceDirectoryObjectFetcher*) getregisteredOwnersById : (NSString*)_id;
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getregisteredUsers;

-(MSGraphServiceDirectoryObjectFetcher*) getregisteredUsersById : (NSString*)_id;
@end

@interface MSGraphServiceDeviceFetcher : MSODataEntityFetcher<MSGraphServiceDeviceFetcher>

@end