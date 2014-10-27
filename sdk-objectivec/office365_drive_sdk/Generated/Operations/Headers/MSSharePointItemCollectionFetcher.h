/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSharePointItem.h"
#import "MSSharePointODataCollectionFetcher.h"
#import "MSSharePointItemFetcher.h"

/**
* The header for type MSSharePointItemCollectionFetcher.
*/

@protocol MSSharePointItemCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSSharePointItem> *items, NSError *error))callback;

@end

@interface MSSharePointItemCollectionFetcher : MSSharePointODataCollectionFetcher<MSSharePointItemCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSSharePointODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSSharePointItem* )entity :(void (^)(MSSharePointItem *item, NSError *e))callback;

-(MSSharePointItemFetcher*)getById:(NSString *)Id;

@end
