/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOMessage.h"
#import "MSOItemOperations.h"
#import "MSOItemBody.h"
#import "MSOImportance.h"
#import "MSORecipient.h"
#import "MSOAttachment.h"

/**
* The header for type MSOMessageOperations.
*/


@interface MSOMessageOperations : MSOItemOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;
-(NSURLSessionDataTask*)copy : (NSString *) destinationId : (void (^)(MSOMessage *message, NSError *error))callback;			
-(NSURLSessionDataTask*)move : (NSString *) destinationId : (void (^)(MSOMessage *message, NSError *error))callback;			
-(NSURLSessionDataTask*)createReply : (void (^)(MSOMessage *message, NSError *error))callback;			
-(NSURLSessionDataTask*)createReplyAll : (void (^)(MSOMessage *message, NSError *error))callback;			
-(NSURLSessionDataTask*)createForward : (void (^)(MSOMessage *message, NSError *error))callback;			
-(NSURLSessionDataTask*)reply : (NSString *) comment : (void (^)(int returnValue, NSError *error))callback;			
-(NSURLSessionDataTask*)replyAll : (NSString *) comment : (void (^)(int returnValue, NSError *error))callback;			
-(NSURLSessionDataTask*)forward : (NSString *) comment : (NSMutableArray<MSORecipient> *) toRecipients : (void (^)(int returnValue, NSError *error))callback;			
-(NSURLSessionDataTask*)send : (void (^)(int returnValue, NSError *error))callback;			

@end