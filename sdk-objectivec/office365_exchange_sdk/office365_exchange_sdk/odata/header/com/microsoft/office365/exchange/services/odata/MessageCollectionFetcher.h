/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "ODataCollectionFetcher.h"
#import "Message.h"

@interface MessageCollectionFetcher : ODataCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<ODataExecutable>)parent;
-(NSURLSessionDataTask *)execute:(void (^)(NSArray<Message> *messages, NSError *error))callback;
-(NSURLSessionDataTask *)add:(Message* )entity :(void (^)(Message*, NSError *e))callback;
@end