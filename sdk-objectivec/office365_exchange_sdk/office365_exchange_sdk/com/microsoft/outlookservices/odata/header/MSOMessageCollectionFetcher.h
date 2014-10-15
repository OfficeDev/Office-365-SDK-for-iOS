/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataCollectionFetcher.h"
#import "MSOMessage.h"
#import "MSOMessageFetcher.h"

/**
* The header for type MSOMessageCollectionFetcher.
*/

@interface MSOMessageCollectionFetcher : MSOODataCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOMessage> *Message, NSError *error))callback;

-(NSURLSessionDataTask*)add:(MSOMessage* )entity :(void (^)(MSOMessage *message, NSError *e))callback;

-(MSOMessageFetcher*)getById:(NSString *)Id;
@end
