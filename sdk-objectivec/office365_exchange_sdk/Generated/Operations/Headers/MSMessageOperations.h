/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSMessage.h"
#import "MSItemOperations.h"
#import "MSItemBody.h"
#import "MSImportance.h"
#import "MSRecipient.h"
#import "MSAttachment.h"

/**
* The header for type MSMessageOperations.
*/


@interface MSMessageOperations : MSItemOperations

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;
-(NSURLSessionDataTask*)copy : (NSString *) destinationId : (void (^)(MSMessage *message, NSError *error))callback;			
-(NSURLSessionDataTask*)move : (NSString *) destinationId : (void (^)(MSMessage *message, NSError *error))callback;			
-(NSURLSessionDataTask*)createReply : (void (^)(MSMessage *message, NSError *error))callback;			
-(NSURLSessionDataTask*)createReplyAll : (void (^)(MSMessage *message, NSError *error))callback;			
-(NSURLSessionDataTask*)createForward : (void (^)(MSMessage *message, NSError *error))callback;			
-(NSURLSessionDataTask*)reply : (NSString *) comment : (void (^)(int returnValue, NSError *error))callback;			
-(NSURLSessionDataTask*)replyAll : (NSString *) comment : (void (^)(int returnValue, NSError *error))callback;			
-(NSURLSessionDataTask*)forward : (NSString *) comment : (NSMutableArray<MSRecipient> *) toRecipients : (void (^)(int returnValue, NSError *error))callback;			
-(NSURLSessionDataTask*)send : (void (^)(int returnValue, NSError *error))callback;			

@end