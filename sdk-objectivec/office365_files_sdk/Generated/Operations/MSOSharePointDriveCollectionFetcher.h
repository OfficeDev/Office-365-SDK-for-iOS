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
#import "MSOSharePointDrive.h"
#import "MSOSharePointDriveFetcher.h"

/**
* The header for type MSOSharePointDriveCollectionFetcher.
*/

@protocol MSOSharePointDriveCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOSharePointDrive> *drives, NSError *error))callback;

@end

@interface MSOSharePointDriveCollectionFetcher : MSODataCollectionFetcher<MSOSharePointDriveCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSOSharePointDrive* )entity withCallback:(void (^)(MSOSharePointDrive *drive, NSError *e))callback;

-(MSOSharePointDriveFetcher*)getById:(NSString *)Id;

@end