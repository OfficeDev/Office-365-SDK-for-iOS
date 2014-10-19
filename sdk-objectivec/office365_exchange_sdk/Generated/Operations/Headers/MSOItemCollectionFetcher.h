/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataCollectionFetcher.h"
#import "MSOItem.h"
#import "MSOItemFetcher.h"

/**
* The header for type MSOItemCollectionFetcher.
*/

@interface MSOItemCollectionFetcher : MSOODataCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOItem> *Item, NSError *error))callback;

-(NSURLSessionDataTask*)add:(MSOItem* )entity :(void (^)(MSOItem *item, NSError *e))callback;

-(MSOItemFetcher*)getById:(NSString *)Id;
@end
