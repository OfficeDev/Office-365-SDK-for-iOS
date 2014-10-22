/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOEvent.h"
#import "MSOODataCollectionFetcher.h"
#import "MSOEventFetcher.h"

/**
* The header for type MSOEventCollectionFetcher.
*/

@protocol MSOEventCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOEvent> *events, NSError *error))callback;

@end

@interface MSOEventCollectionFetcher : MSOODataCollectionFetcher<MSOEventCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSOEvent* )entity :(void (^)(MSOEvent *event, NSError *e))callback;

-(MSOEventFetcher*)getById:(NSString *)Id;

@end
