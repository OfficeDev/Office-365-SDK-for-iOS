/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataCollectionFetcher.h"
#import "MSOEvent.h"
#import "MSOEventFetcher.h"

/**
* The header for type MSOEventCollectionFetcher.
*/

@interface MSOEventCollectionFetcher : MSOODataCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOEvent> *Event, NSError *error))callback;

-(NSURLSessionDataTask*)add:(MSOEvent* )entity :(void (^)(MSOEvent *event, NSError *e))callback;

-(MSOEventFetcher*)getById:(NSString *)Id;
@end
