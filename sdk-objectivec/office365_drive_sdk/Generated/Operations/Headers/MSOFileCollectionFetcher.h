/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOFile.h"
#import "MSOODataCollectionFetcher.h"
#import "MSOFileFetcher.h"

/**
* The header for type MSOFileCollectionFetcher.
*/


@protocol MSOFileCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOFile> *files, NSError *error))callback;

@end

@interface MSOFileCollectionFetcher : MSOODataCollectionFetcher<MSOFileCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSOFile* )entity :(void (^)(MSOFile *file, NSError *e))callback;

-(MSOFileFetcher*)getById:(NSString *)Id;

@end
