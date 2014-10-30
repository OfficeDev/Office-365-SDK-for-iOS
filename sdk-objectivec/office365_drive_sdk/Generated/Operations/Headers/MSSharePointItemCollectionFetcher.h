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

#import "MSSharePointItem.h"
#import "MSSharePointODataCollectionFetcher.h"
#import "MSSharePointItemFetcher.h"

/**
* The header for type MSSharePointItemCollectionFetcher.
*/

@protocol MSSharePointItemCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSSharePointItem> *items, NSError *error))callback;

@end

@interface MSSharePointItemCollectionFetcher : MSSharePointODataCollectionFetcher<MSSharePointItemCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSSharePointODataReadable>)parent;

-(NSURLSessionDataTask*)add:(MSSharePointItem* )entity :(void (^)(MSSharePointItem *item, NSError *e))callback;

-(MSSharePointItemFetcher*)getById:(NSString *)Id;

@end
