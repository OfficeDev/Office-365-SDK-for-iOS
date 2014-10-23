/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSEvent.h"
#import "MSODataCollectionFetcher.h"
#import "MSEventFetcher.h"

/**
* The header for type MSEventCollectionFetcher.
*/

@protocol MSEventCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSEvent> *events, NSError *error))callback;

@end

@interface MSEventCollectionFetcher : MSODataCollectionFetcher<MSEventCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSEvent* )entity :(void (^)(MSEvent *event, NSError *e))callback;

-(MSEventFetcher*)getById:(NSString *)Id;

@end
