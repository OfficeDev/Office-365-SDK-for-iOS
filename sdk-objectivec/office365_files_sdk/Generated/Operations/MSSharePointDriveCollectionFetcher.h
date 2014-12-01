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
#import "MSSharePointDrive.h"
#import "MSSharePointDriveFetcher.h"

/**
* The header for type MSSharePointDriveCollectionFetcher.
*/

@protocol MSSharePointDriveCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSSharePointDrive> *drives, MSODataException *error))callback;

-(id<MSSharePointDriveCollectionFetcher>)select : (NSString*) params;
-(id<MSSharePointDriveCollectionFetcher>)filter : (NSString*) params;
-(id<MSSharePointDriveCollectionFetcher>)top : (int) value;
-(id<MSSharePointDriveCollectionFetcher>)skip : (int) value;
-(id<MSSharePointDriveCollectionFetcher>)expand : (NSString*) value;
-(id<MSSharePointDriveCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSSharePointDriveCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSSharePointDriveCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
@end

@interface MSSharePointDriveCollectionFetcher : MSODataCollectionFetcher<MSSharePointDriveCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSSharePointDriveFetcher*)getById:(NSString *)Id;
-(NSURLSessionDataTask*)addDrive:(MSSharePointDrive* )entity withCallback:(void (^)(MSSharePointDrive *drive, MSODataException *e))callback;

@end