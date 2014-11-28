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

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;

-(NSURLSessionDataTask*)copy : (NSString *) destinationId : (void (^)(MSOutlookMessage *message, MSODataException *error))callback;			

-(NSURLSessionDataTask*)move : (NSString *) destinationId : (void (^)(MSOutlookMessage *message, MSODataException *error))callback;			

-(NSURLSessionDataTask*)createReply : (void (^)(MSOutlookMessage *message, MSODataException *error))callback;			

-(NSURLSessionDataTask*)createReplyAll : (void (^)(MSOutlookMessage *message, MSODataException *error))callback;			

-(NSURLSessionDataTask*)createForward : (void (^)(MSOutlookMessage *message, MSODataException *error))callback;			

-(NSURLSessionDataTask*)reply : (NSString *) comment : (void (^)(int returnValue, MSODataException *error))callback;			

-(NSURLSessionDataTask*)replyAll : (NSString *) comment : (void (^)(int returnValue, MSODataException *error))callback;			

-(NSURLSessionDataTask*)forward : (NSString *) comment : (NSMutableArray<MSOutlookRecipient> *) toRecipients : (void (^)(int returnValue, MSODataException *error))callback;			

-(NSURLSessionDataTask*)send : (void (^)(int returnValue, MSODataException *error))callback;			

@end