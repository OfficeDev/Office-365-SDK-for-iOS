/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 *
 * Warning: This code was generated automatically. Edits will be overwritten.
 * To make changes to this code, please make changes to the generation framework itself:
 * https://github.com/MSOpenTech/odata-codegen
 *******************************************************************************/

#import "MSOutlookItem.h"
#import "MSOutlookODataCollectionFetcher.h"
#import "MSOutlookItemFetcher.h"

/**
* The header for type MSOutlookItemCollectionFetcher.
*/

@protocol MSOutlookItemCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOutlookItem> *items, NSError *error))callback;

@end

@interface MSOutlookItemCollectionFetcher : MSOutlookODataCollectionFetcher<MSOutlookItemCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataReadable>)parent;

-(NSURLSessionDataTask*)add:(MSOutlookItem* )entity :(void (^)(MSOutlookItem *item, NSError *e))callback;

-(MSOutlookItemFetcher*)getById:(NSString *)Id;

@end
