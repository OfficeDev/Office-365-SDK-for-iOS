/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@implementation MessageOperations

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent;

-(NSURLSessionDataTask*)copy : (NSString *) DestinationId : :(void (^)(Message d, NSError *error))callback;			

-(NSURLSessionDataTask*)move : (NSString *) DestinationId : :(void (^)(Message d, NSError *error))callback;			

-(NSURLSessionDataTask*)createReply : :(void (^)(Message d, NSError *error))callback;			

-(NSURLSessionDataTask*)createReplyAll : :(void (^)(Message d, NSError *error))callback;			

-(NSURLSessionDataTask*)createForward : :(void (^)(Message d, NSError *error))callback;			

-(NSURLSessionDataTask*)reply : (NSString *) Comment : :(void (^)(int d, NSError *error))callback;			

-(NSURLSessionDataTask*)replyAll : (NSString *) Comment : :(void (^)(int d, NSError *error))callback;			

-(NSURLSessionDataTask*)forward : (NSString *) Comment : (NSMutableArray<Recipient> *) ToRecipients : :(void (^)(int d, NSError *error))callback;			

-(NSURLSessionDataTask*)send : :(void (^)(int d, NSError *error))callback;			
@end