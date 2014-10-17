/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataCollectionFetcher.h"
#import "MSODrive.h"
#import "MSODriveFetcher.h"

/**
* The header for type MSODriveCollectionFetcher.
*/

@interface MSODriveCollectionFetcher : MSOODataCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSODrive> *Drive, NSError *error))callback;

-(NSURLSessionDataTask*)add:(MSODrive* )entity :(void (^)(MSODrive *drive, NSError *e))callback;

-(MSODriveFetcher*)getById:(NSString *)Id;
@end
