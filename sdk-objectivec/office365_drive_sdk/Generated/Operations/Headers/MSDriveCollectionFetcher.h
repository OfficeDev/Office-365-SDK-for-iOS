/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDrive.h"
#import "MSODataCollectionFetcher.h"
#import "MSDriveFetcher.h"

/**
* The header for type MSDriveCollectionFetcher.
*/

@protocol MSDriveCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSDrive> *drives, NSError *error))callback;

@end

@interface MSDriveCollectionFetcher : MSODataCollectionFetcher<MSDriveCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSDrive* )entity :(void (^)(MSDrive *drive, NSError *e))callback;

-(MSDriveFetcher*)getById:(NSString *)Id;

@end
