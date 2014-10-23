/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSMessage.h"
#import "MSODataCollectionFetcher.h"
#import "MSMessageFetcher.h"

/**
* The header for type MSMessageCollectionFetcher.
*/

@protocol MSMessageCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSMessage> *messages, NSError *error))callback;

@end

@interface MSMessageCollectionFetcher : MSODataCollectionFetcher<MSMessageCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSMessage* )entity :(void (^)(MSMessage *message, NSError *e))callback;

-(MSMessageFetcher*)getById:(NSString *)Id;

@end
