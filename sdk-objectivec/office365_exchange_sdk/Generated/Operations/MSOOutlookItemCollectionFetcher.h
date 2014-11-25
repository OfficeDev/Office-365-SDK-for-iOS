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
#import "MSOOutlookItem.h"
#import "MSOOutlookItemFetcher.h"

/**
* The header for type MSOOutlookItemCollectionFetcher.
*/

@protocol MSOOutlookItemCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOOutlookItem> *items, NSError *error))callback;

@end

@interface MSOOutlookItemCollectionFetcher : MSODataCollectionFetcher<MSOOutlookItemCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSOOutlookItem* )entity withCallback:(void (^)(MSOOutlookItem *item, NSError *e))callback;

-(MSOOutlookItemFetcher*)getById:(NSString *)Id;

@end