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

#import "MSOutlookEvent.h"
#import "MSOutlookODataCollectionFetcher.h"
#import "MSOutlookEventFetcher.h"

/**
* The header for type MSOutlookEventCollectionFetcher.
*/

@protocol MSOutlookEventCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOutlookEvent> *events, NSError *error))callback;

@end

@interface MSOutlookEventCollectionFetcher : MSOutlookODataCollectionFetcher<MSOutlookEventCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataReadable>)parent;

-(NSURLSessionDataTask*)add:(MSOutlookEvent* )entity :(void (^)(MSOutlookEvent *event, NSError *e))callback;

-(MSOutlookEventFetcher*)getById:(NSString *)Id;

@end
