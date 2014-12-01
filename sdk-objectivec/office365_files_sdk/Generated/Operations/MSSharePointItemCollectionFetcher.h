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
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSSharePointItem> *items, MSODataException *error))callback;

-(id<MSSharePointItemCollectionFetcher>)select : (NSString*) params;
-(id<MSSharePointItemCollectionFetcher>)filter : (NSString*) params;
-(id<MSSharePointItemCollectionFetcher>)top : (int) value;
-(id<MSSharePointItemCollectionFetcher>)skip : (int) value;
-(id<MSSharePointItemCollectionFetcher>)expand : (NSString*) value;
-(id<MSSharePointItemCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSSharePointItemCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSSharePointItemCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
@end

@interface MSSharePointItemCollectionFetcher : MSODataCollectionFetcher<MSSharePointItemCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSSharePointItemFetcher*)getById:(NSString *)Id;
-(NSURLSessionDataTask*)addItem:(MSSharePointItem* )entity withCallback:(void (^)(MSSharePointItem *item, MSODataException *e))callback;

@end