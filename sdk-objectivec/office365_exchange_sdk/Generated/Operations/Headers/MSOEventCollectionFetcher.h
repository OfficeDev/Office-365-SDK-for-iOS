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

@interface MSOEventCollectionFetcher : MSOODataCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSOEvent* )entity :(void (^)(MSOEvent *event, NSError *e))callback;

-(MSOEventFetcher*)getById:(NSString *)Id;
@end
