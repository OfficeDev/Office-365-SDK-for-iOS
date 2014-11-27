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
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSSharePointDrive> *drives, NSError *error))callback;
-(MSSharePointDriveFetcher*)select : (NSString*) params;
-(MSSharePointDriveFetcher*)filter : (NSString*) params;
-(MSSharePointDriveFetcher*)top : (int) value;
-(MSSharePointDriveFetcher*)skip : (int) value;
-(MSSharePointDriveFetcher*)expand : (NSString*) value;
-(MSSharePointDriveFetcher*)orderBy : (NSString*) params;

@end

@interface MSSharePointDriveCollectionFetcher : MSODataCollectionFetcher<MSSharePointDriveCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addDrive:(MSSharePointDrive* )entity withCallback:(void (^)(MSSharePointDrive *drive, NSError *e))callback;

-(MSSharePointDriveFetcher*)getById:(NSString *)Id;

@end