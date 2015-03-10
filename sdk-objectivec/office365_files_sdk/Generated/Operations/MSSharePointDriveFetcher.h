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

@class MSSharePointDriveOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSSharePointModels.h"

/**
* The header for type MSSharePointDriveFetcher.
*/


@protocol MSSharePointDriveFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSSharePointDrive* drive, MSODataException *error))callback;
-(NSURLSessionTask*) updateDrive:(id)entity withCallback:(void (^)(MSSharePointDrive*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteDrive:(void (^)(int status, MSODataException * error))callback;
-(id<MSSharePointDriveFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSSharePointDriveFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSSharePointDriveFetcher>)select : (NSString*) params;
-(id<MSSharePointDriveFetcher>)expand : (NSString*) value;

@required
-(MSSharePointDriveOperations*) getOperations;
@end

@interface MSSharePointDriveFetcher : MSODataEntityFetcher<MSSharePointDriveFetcher>

@end