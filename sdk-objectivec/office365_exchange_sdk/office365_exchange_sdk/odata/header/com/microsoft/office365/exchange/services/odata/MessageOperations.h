/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "ODataOperations.h"
#import "ItemBody.h"
#import "Importance.h"
#import "Recipient.h"
#import "MeetingMessageType.h"
#import "Attachment.h"

@interface MessageOperations : ODataOperations

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent;
-(NSURLSessionDataTask*)copy : (NSString *) DestinationId : (void (^)(Message *message, NSError *error))callback;			
-(NSURLSessionDataTask*)move : (NSString *) DestinationId : (void (^)(Message *message, NSError *error))callback;			
-(NSURLSessionDataTask*)createReply : (void (^)(Message *message, NSError *error))callback;			
-(NSURLSessionDataTask*)createReplyAll : (void (^)(Message *message, NSError *error))callback;			
-(NSURLSessionDataTask*)createForward : (void (^)(Message *message, NSError *error))callback;			
-(NSURLSessionDataTask*)reply : (NSString *) Comment : (void (^)(int returnValue, NSError *error))callback;			
-(NSURLSessionDataTask*)replyAll : (NSString *) Comment : (void (^)(int returnValue, NSError *error))callback;			
-(NSURLSessionDataTask*)forward : (NSString *) Comment : (NSMutableArray<Recipient> *) ToRecipients : (void (^)(int returnValue, NSError *error))callback;			
-(NSURLSessionDataTask*)send : (void (^)(int returnValue, NSError *error))callback;			

@end