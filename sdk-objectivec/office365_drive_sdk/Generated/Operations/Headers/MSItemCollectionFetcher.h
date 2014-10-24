/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSItem.h"
#import "MSODataCollectionFetcher.h"
#import "MSItemFetcher.h"

/**
* The header for type MSItemCollectionFetcher.
*/

@protocol MSItemCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSItem> *items, NSError *error))callback;

@end

@interface MSItemCollectionFetcher : MSODataCollectionFetcher<MSItemCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSItem* )entity :(void (^)(MSItem *item, NSError *e))callback;

-(MSItemFetcher*)getById:(NSString *)Id;

@end
