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

@class MSGraphServiceDriveOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceDriveFetcher.
*/


@protocol MSGraphServiceDriveFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSGraphServiceDrive* drive, MSODataException *error))callback;
-(NSURLSessionTask*) updateDrive:(id)entity withCallback:(void (^)(MSGraphServiceDrive*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteDrive:(void (^)(int status, MSODataException * error))callback;
-(id<MSGraphServiceDriveFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceDriveFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSGraphServiceDriveFetcher>)select : (NSString*) params;
-(id<MSGraphServiceDriveFetcher>)expand : (NSString*) value;

@required
-(MSGraphServiceDriveOperations*) getOperations;
@end

@interface MSGraphServiceDriveFetcher : MSODataEntityFetcher<MSGraphServiceDriveFetcher>

@end