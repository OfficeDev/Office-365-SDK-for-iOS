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
#import "MSOutlookEvent.h"
#import "MSOutlookEventFetcher.h"

/**
* The header for type MSOutlookEventCollectionFetcher.
*/

@protocol MSOutlookEventCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOutlookEvent> *events, NSError *error))callback;

-(id<MSOutlookEventCollectionFetcher>)select : (NSString*) params;
-(id<MSOutlookEventCollectionFetcher>)filter : (NSString*) params;
-(id<MSOutlookEventCollectionFetcher>)top : (int) value;
-(id<MSOutlookEventCollectionFetcher>)skip : (int) value;
-(id<MSOutlookEventCollectionFetcher>)expand : (NSString*) value;
-(id<MSOutlookEventCollectionFetcher>)orderBy : (NSString*) params;

@end

@interface MSOutlookEventCollectionFetcher : MSODataCollectionFetcher<MSOutlookEventCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;
-(MSOutlookEventFetcher*)getById:(NSString *)Id;
-(NSURLSessionDataTask*)addEvent:(MSOutlookEvent* )entity withCallback:(void (^)(MSOutlookEvent *event, NSError *e))callback;

@end