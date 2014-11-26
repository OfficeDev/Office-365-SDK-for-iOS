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
#import "MSOutlookItem.h"
#import "MSOutlookItemFetcher.h"

/**
* The header for type MSOutlookItemCollectionFetcher.
*/

@protocol MSOutlookItemCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOutlookItem> *items, NSError *error))callback;

@end

@interface MSOutlookItemCollectionFetcher : MSODataCollectionFetcher<MSOutlookItemCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSOutlookItem* )entity withCallback:(void (^)(MSOutlookItem *item, NSError *e))callback;

-(MSOutlookItemFetcher*)getById:(NSString *)Id;

@end