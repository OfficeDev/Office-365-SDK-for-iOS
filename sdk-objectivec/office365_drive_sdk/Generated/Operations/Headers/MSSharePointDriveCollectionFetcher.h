/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSharePointDrive.h"
#import "MSSharePointODataCollectionFetcher.h"
#import "MSSharePointDriveFetcher.h"

/**
* The header for type MSSharePointDriveCollectionFetcher.
*/

@protocol MSSharePointDriveCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSSharePointDrive> *drives, NSError *error))callback;

@end

@interface MSSharePointDriveCollectionFetcher : MSSharePointODataCollectionFetcher<MSSharePointDriveCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSSharePointODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSSharePointDrive* )entity :(void (^)(MSSharePointDrive *drive, NSError *e))callback;

-(MSSharePointDriveFetcher*)getById:(NSString *)Id;

@end
