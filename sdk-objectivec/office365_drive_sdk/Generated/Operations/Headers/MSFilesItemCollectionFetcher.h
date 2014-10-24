/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFilesItem.h"
#import "MSFilesODataCollectionFetcher.h"
#import "MSFilesItemFetcher.h"

/**
* The header for type MSFilesItemCollectionFetcher.
*/

@protocol MSFilesItemCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSFilesItem> *items, NSError *error))callback;

@end

@interface MSFilesItemCollectionFetcher : MSFilesODataCollectionFetcher<MSFilesItemCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSFilesItem* )entity :(void (^)(MSFilesItem *item, NSError *e))callback;

-(MSFilesItemFetcher*)getById:(NSString *)Id;

@end
