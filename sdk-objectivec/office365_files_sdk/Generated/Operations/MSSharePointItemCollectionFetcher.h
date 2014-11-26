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

#import <office365_odata_base/office365_odata_base.h>
#import "MSSharePointItem.h"
#import "MSSharePointItemFetcher.h"

/**
* The header for type MSSharePointItemCollectionFetcher.
*/

@protocol MSSharePointItemCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSSharePointItem> *items, NSError *error))callback;

@end

@interface MSSharePointItemCollectionFetcher : MSODataCollectionFetcher<MSSharePointItemCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSSharePointItem* )entity withCallback:(void (^)(MSSharePointItem *item, NSError *e))callback;

-(MSSharePointItemFetcher*)getById:(NSString *)Id;

@end