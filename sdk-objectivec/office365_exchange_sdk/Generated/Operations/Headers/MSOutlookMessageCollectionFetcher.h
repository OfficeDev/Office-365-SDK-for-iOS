/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookMessage.h"
#import "MSOutlookODataCollectionFetcher.h"
#import "MSOutlookMessageFetcher.h"

/**
* The header for type MSOutlookMessageCollectionFetcher.
*/

@protocol MSOutlookMessageCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOutlookMessage> *messages, NSError *error))callback;

@end

@interface MSOutlookMessageCollectionFetcher : MSOutlookODataCollectionFetcher<MSOutlookMessageCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSOutlookMessage* )entity :(void (^)(MSOutlookMessage *message, NSError *e))callback;

-(MSOutlookMessageFetcher*)getById:(NSString *)Id;

@end
