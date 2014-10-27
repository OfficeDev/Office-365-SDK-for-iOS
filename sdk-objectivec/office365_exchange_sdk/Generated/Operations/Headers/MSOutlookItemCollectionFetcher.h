/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookItem.h"
#import "MSOutlookODataCollectionFetcher.h"
#import "MSOutlookItemFetcher.h"

/**
* The header for type MSOutlookItemCollectionFetcher.
*/

@protocol MSOutlookItemCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOutlookItem> *items, NSError *error))callback;

@end

@interface MSOutlookItemCollectionFetcher : MSOutlookODataCollectionFetcher<MSOutlookItemCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSOutlookItem* )entity :(void (^)(MSOutlookItem *item, NSError *e))callback;

-(MSOutlookItemFetcher*)getById:(NSString *)Id;

@end
