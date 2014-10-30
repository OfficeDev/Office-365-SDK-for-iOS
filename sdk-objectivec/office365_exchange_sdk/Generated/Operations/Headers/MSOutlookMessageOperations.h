/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 *
 * Warning: This code was generated automatically. Edits will be overwritten.
 * To make changes to this code, please make changes to the generation framework itself:
 * https://github.com/MSOpenTech/odata-codegen
 *******************************************************************************/

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

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataReadable>)parent;
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