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
#import "MSOSharePointItem.h"
#import "MSOSharePointItemFetcher.h"

/**
* The header for type MSOSharePointItemCollectionFetcher.
*/

@protocol MSOSharePointItemCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOSharePointItem> *items, NSError *error))callback;

@end

@interface MSOSharePointItemCollectionFetcher : MSODataCollectionFetcher<MSOSharePointItemCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSOSharePointItem* )entity withCallback:(void (^)(MSOSharePointItem *item, NSError *e))callback;

-(MSOSharePointItemFetcher*)getById:(NSString *)Id;

@end