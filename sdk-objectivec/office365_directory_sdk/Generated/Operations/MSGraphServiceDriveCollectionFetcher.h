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

@class MSGraphServiceDriveFetcher;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceDriveCollectionFetcher.
*/

@protocol MSGraphServiceDriveCollectionFetcher<MSODataCollectionFetcher>

@optional
-(NSURLSessionTask*)read:(void (^)(NSArray<MSGraphServiceDrive> *drives, MSODataException *error))callback;

-(id<MSGraphServiceDriveCollectionFetcher>)select : (NSString*) params;
-(id<MSGraphServiceDriveCollectionFetcher>)filter : (NSString*) params;
-(id<MSGraphServiceDriveCollectionFetcher>)top : (int) value;
-(id<MSGraphServiceDriveCollectionFetcher>)skip : (int) value;
-(id<MSGraphServiceDriveCollectionFetcher>)expand : (NSString*) value;
-(id<MSGraphServiceDriveCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSGraphServiceDriveCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceDriveCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@required

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSGraphServiceDriveFetcher*)getById:(NSString *)Id;
-(NSURLSessionTask*)addDrive:(MSGraphServiceDrive* )entity withCallback:(void (^)(MSGraphServiceDrive *drive, MSODataException *e))callback;

@end

@interface MSGraphServiceDriveCollectionFetcher : MSODataCollectionFetcher<MSGraphServiceDriveCollectionFetcher>

@end