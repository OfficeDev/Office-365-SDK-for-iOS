/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookContact.h"
#import "MSOutlookODataCollectionFetcher.h"
#import "MSOutlookContactFetcher.h"

/**
* The header for type MSOutlookContactCollectionFetcher.
*/

@protocol MSOutlookContactCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOutlookContact> *contacts, NSError *error))callback;

@end

@interface MSOutlookContactCollectionFetcher : MSOutlookODataCollectionFetcher<MSOutlookContactCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSOutlookContact* )entity :(void (^)(MSOutlookContact *contact, NSError *e))callback;

-(MSOutlookContactFetcher*)getById:(NSString *)Id;

@end
