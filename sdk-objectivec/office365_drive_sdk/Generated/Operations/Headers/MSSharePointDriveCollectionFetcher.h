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

#import "MSSharePointDrive.h"
#import "MSSharePointODataCollectionFetcher.h"
#import "MSSharePointDriveFetcher.h"

/**
* The header for type MSSharePointDriveCollectionFetcher.
*/

@protocol MSSharePointDriveCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSSharePointDrive> *drives, NSError *error))callback;

@end

@interface MSSharePointDriveCollectionFetcher : MSSharePointODataCollectionFetcher<MSSharePointDriveCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSSharePointODataReadable>)parent;

-(NSURLSessionDataTask*)add:(MSSharePointDrive* )entity :(void (^)(MSSharePointDrive *drive, NSError *e))callback;

-(MSSharePointDriveFetcher*)getById:(NSString *)Id;

@end
