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

@class MSGraphServiceItemFetcher;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceItemCollectionFetcher.
*/

@protocol MSGraphServiceItemCollectionFetcher<MSODataCollectionFetcher>

@optional
-(NSURLSessionTask*)read:(void (^)(NSArray<MSGraphServiceItem> *items, MSODataException *error))callback;

-(id<MSGraphServiceItemCollectionFetcher>)select : (NSString*) params;
-(id<MSGraphServiceItemCollectionFetcher>)filter : (NSString*) params;
-(id<MSGraphServiceItemCollectionFetcher>)top : (int) value;
-(id<MSGraphServiceItemCollectionFetcher>)skip : (int) value;
-(id<MSGraphServiceItemCollectionFetcher>)expand : (NSString*) value;
-(id<MSGraphServiceItemCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSGraphServiceItemCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceItemCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@required

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSGraphServiceItemFetcher*)getById:(NSString *)Id;
-(NSURLSessionTask*)addItem:(MSGraphServiceItem* )entity withCallback:(void (^)(MSGraphServiceItem *item, MSODataException *e))callback;

@end

@interface MSGraphServiceItemCollectionFetcher : MSODataCollectionFetcher<MSGraphServiceItemCollectionFetcher>

@end