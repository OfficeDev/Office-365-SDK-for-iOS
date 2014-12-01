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
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOutlookItem> *items, MSODataException *error))callback;

-(id<MSOutlookItemCollectionFetcher>)select : (NSString*) params;
-(id<MSOutlookItemCollectionFetcher>)filter : (NSString*) params;
-(id<MSOutlookItemCollectionFetcher>)top : (int) value;
-(id<MSOutlookItemCollectionFetcher>)skip : (int) value;
-(id<MSOutlookItemCollectionFetcher>)expand : (NSString*) value;
-(id<MSOutlookItemCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSOutlookItemCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSOutlookItemCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
@end

@interface MSOutlookItemCollectionFetcher : MSODataCollectionFetcher<MSOutlookItemCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSOutlookItemFetcher*)getById:(NSString *)Id;
-(NSURLSessionDataTask*)addItem:(MSOutlookItem* )entity withCallback:(void (^)(MSOutlookItem *item, MSODataException *e))callback;

@end