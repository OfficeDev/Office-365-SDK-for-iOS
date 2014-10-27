/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookMessage.h"
#import "MSOutlookItemOperations.h"
#import "MSOutlookItemBody.h"
#import "MSOutlookImportance.h"
#import "MSOutlookRecipient.h"
#import "MSOutlookAttachment.h"

/**
* The header for type MSOutlookMessageOperations.
*/


@interface MSOutlookMessageOperations : MSOutlookItemOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;
-(NSURLSessionDataTask*)copy : (NSString *) destinationId : (void (^)(MSOutlookMessage *message, NSError *error))callback;			
-(NSURLSessionDataTask*)move : (NSString *) destinationId : (void (^)(MSOutlookMessage *message, NSError *error))callback;			
-(NSURLSessionDataTask*)createReply : (void (^)(MSOutlookMessage *message, NSError *error))callback;			
-(NSURLSessionDataTask*)createReplyAll : (void (^)(MSOutlookMessage *message, NSError *error))callback;			
-(NSURLSessionDataTask*)createForward : (void (^)(MSOutlookMessage *message, NSError *error))callback;			
-(NSURLSessionDataTask*)reply : (NSString *) comment : (void (^)(int returnValue, NSError *error))callback;			
-(NSURLSessionDataTask*)replyAll : (NSString *) comment : (void (^)(int returnValue, NSError *error))callback;			
-(NSURLSessionDataTask*)forward : (NSString *) comment : (NSMutableArray<MSOutlookRecipient> *) toRecipients : (void (^)(int returnValue, NSError *error))callback;			
-(NSURLSessionDataTask*)send : (void (^)(int returnValue, NSError *error))callback;			

@end