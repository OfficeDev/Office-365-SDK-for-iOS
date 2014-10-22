/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOMessage.h"
#import "MSOODataCollectionFetcher.h"
#import "MSOMessageFetcher.h"

/**
* The header for type MSOMessageCollectionFetcher.
*/

@protocol MSOMessageCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOMessage> *messages, NSError *error))callback;

@end

@interface MSOMessageCollectionFetcher : MSOODataCollectionFetcher<MSOMessageCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSOMessage* )entity :(void (^)(MSOMessage *message, NSError *e))callback;

-(MSOMessageFetcher*)getById:(NSString *)Id;

@end
