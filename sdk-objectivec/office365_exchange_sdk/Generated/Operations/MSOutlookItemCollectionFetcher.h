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

@class MSOutlookItemFetcher;

#import <office365_odata_base/office365_odata_base.h>
#import "MSOutlookModels.h"

/**
* The header for type MSOutlookItemCollectionFetcher.
*/

@protocol MSOutlookItemCollectionFetcher<MSODataCollectionFetcher>

@optional
-(NSURLSessionTask*)read:(void (^)(NSArray<MSOutlookItem> *items, MSODataException *error))callback;

-(id<MSOutlookItemCollectionFetcher>)select : (NSString*) params;
-(id<MSOutlookItemCollectionFetcher>)filter : (NSString*) params;
-(id<MSOutlookItemCollectionFetcher>)top : (int) value;
-(id<MSOutlookItemCollectionFetcher>)skip : (int) value;
-(id<MSOutlookItemCollectionFetcher>)expand : (NSString*) value;
-(id<MSOutlookItemCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSOutlookItemCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSOutlookItemCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@required

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSOutlookItemFetcher*)getById:(NSString *)Id;
-(NSURLSessionTask*)addItem:(MSOutlookItem* )entity withCallback:(void (^)(MSOutlookItem *item, MSODataException *e))callback;

@end

@interface MSOutlookItemCollectionFetcher : MSODataCollectionFetcher<MSOutlookItemCollectionFetcher>

@end