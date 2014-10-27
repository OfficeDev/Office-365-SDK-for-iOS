/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookEvent.h"
#import "MSOutlookODataCollectionFetcher.h"
#import "MSOutlookEventFetcher.h"

/**
* The header for type MSOutlookEventCollectionFetcher.
*/

@protocol MSOutlookEventCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOutlookEvent> *events, NSError *error))callback;

@end

@interface MSOutlookEventCollectionFetcher : MSOutlookODataCollectionFetcher<MSOutlookEventCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSOutlookEvent* )entity :(void (^)(MSOutlookEvent *event, NSError *e))callback;

-(MSOutlookEventFetcher*)getById:(NSString *)Id;

@end
