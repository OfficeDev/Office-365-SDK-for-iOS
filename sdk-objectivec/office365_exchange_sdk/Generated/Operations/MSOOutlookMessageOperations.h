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

#import <office365_odata_base/office365_odata_base.h>
#import "MSOOutlookMessage.h"
#import "MSOOutlookItemOperations.h"

#import "MSOOutlookItemBody.h"
#import "MSOOutlookImportance.h"
#import "MSOOutlookRecipient.h"
#import "MSOOutlookAttachment.h"

/**
* The header for type MSOOutlookMessageOperations.
*/

@interface MSOOutlookMessageOperations : MSOOutlookItemOperations

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)copy : (NSString *) destinationId : (void (^)(MSOOutlookMessage *message, NSError *error))callback;			

-(NSURLSessionDataTask*)move : (NSString *) destinationId : (void (^)(MSOOutlookMessage *message, NSError *error))callback;			

-(NSURLSessionDataTask*)createReply : (void (^)(MSOOutlookMessage *message, NSError *error))callback;			

-(NSURLSessionDataTask*)createReplyAll : (void (^)(MSOOutlookMessage *message, NSError *error))callback;			

-(NSURLSessionDataTask*)createForward : (void (^)(MSOOutlookMessage *message, NSError *error))callback;			

-(NSURLSessionDataTask*)reply : (NSString *) comment : (void (^)(int returnValue, NSError *error))callback;			

-(NSURLSessionDataTask*)replyAll : (NSString *) comment : (void (^)(int returnValue, NSError *error))callback;			

-(NSURLSessionDataTask*)forward : (NSString *) comment : (NSMutableArray<MSOOutlookRecipient> *) toRecipients : (void (^)(int returnValue, NSError *error))callback;			

-(NSURLSessionDataTask*)send : (void (^)(int returnValue, NSError *error))callback;			

@end