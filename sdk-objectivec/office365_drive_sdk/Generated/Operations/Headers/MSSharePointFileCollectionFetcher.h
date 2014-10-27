/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSharePointFile.h"
#import "MSSharePointODataCollectionFetcher.h"
#import "MSSharePointFileFetcher.h"

/**
* The header for type MSSharePointFileCollectionFetcher.
*/

@protocol MSSharePointFileCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSSharePointFile> *files, NSError *error))callback;

@end

@interface MSSharePointFileCollectionFetcher : MSSharePointODataCollectionFetcher<MSSharePointFileCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSSharePointODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSSharePointFile* )entity :(void (^)(MSSharePointFile *file, NSError *e))callback;

-(MSSharePointFileFetcher*)getById:(NSString *)Id;

@end
