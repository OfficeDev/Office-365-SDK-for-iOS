/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFilesDrive.h"
#import "MSFilesODataCollectionFetcher.h"
#import "MSFilesDriveFetcher.h"

/**
* The header for type MSFilesDriveCollectionFetcher.
*/

@protocol MSFilesDriveCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSFilesDrive> *drives, NSError *error))callback;

@end

@interface MSFilesDriveCollectionFetcher : MSFilesODataCollectionFetcher<MSFilesDriveCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSFilesDrive* )entity :(void (^)(MSFilesDrive *drive, NSError *e))callback;

-(MSFilesDriveFetcher*)getById:(NSString *)Id;

@end
