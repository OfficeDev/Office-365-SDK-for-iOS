/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODrive.h"
#import "MSOODataCollectionFetcher.h"
#import "MSODriveFetcher.h"

/**
* The header for type MSODriveCollectionFetcher.
*/

@protocol MSODriveCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSODrive> *drives, NSError *error))callback;

@end

@interface MSODriveCollectionFetcher : MSOODataCollectionFetcher<MSODriveCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSODrive* )entity :(void (^)(MSODrive *drive, NSError *e))callback;

-(MSODriveFetcher*)getById:(NSString *)Id;

@end
