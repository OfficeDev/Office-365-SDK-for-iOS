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
#import "MSOutlookModels.h"
#import "MSOutlookItemOperations.h"

/**
* The header for type MSOutlookMessageOperations.
*/

@interface MSOutlookMessageOperations : MSOutlookItemOperations

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;

-(NSURLSessionTask*) copy : (NSString *) destinationId :  (void (^)(MSOutlookMessage *message, MSODataException *error)) callback;
-(NSURLSessionTask*) copyRaw : (NSString*) destinationId :  (void(^)(NSString* returnValue, MSODataException *error)) callback;
-(NSURLSessionTask*) move : (NSString *) destinationId :  (void (^)(MSOutlookMessage *message, MSODataException *error)) callback;
-(NSURLSessionTask*) moveRaw : (NSString*) destinationId :  (void(^)(NSString* returnValue, MSODataException *error)) callback;
-(NSURLSessionTask*) createReply :  (void (^)(MSOutlookMessage *message, MSODataException *error)) callback;
-(NSURLSessionTask*) createReplyRaw :  (void(^)(NSString* returnValue, MSODataException *error)) callback;
-(NSURLSessionTask*) createReplyAll :  (void (^)(MSOutlookMessage *message, MSODataException *error)) callback;
-(NSURLSessionTask*) createReplyAllRaw :  (void(^)(NSString* returnValue, MSODataException *error)) callback;
-(NSURLSessionTask*) createForward :  (void (^)(MSOutlookMessage *message, MSODataException *error)) callback;
-(NSURLSessionTask*) createForwardRaw :  (void(^)(NSString* returnValue, MSODataException *error)) callback;
-(NSURLSessionTask*) reply : (NSString *) comment :  (void (^)(int returnValue, MSODataException *error)) callback;
-(NSURLSessionTask*) replyRaw : (NSString*) comment :  (void(^)(NSString* returnValue, MSODataException *error)) callback;
-(NSURLSessionTask*) replyAll : (NSString *) comment :  (void (^)(int returnValue, MSODataException *error)) callback;
-(NSURLSessionTask*) replyAllRaw : (NSString*) comment :  (void(^)(NSString* returnValue, MSODataException *error)) callback;
-(NSURLSessionTask*) forward : (NSString *) comment : (MSOutlookRecipient *) toRecipients :  (void (^)(int returnValue, MSODataException *error)) callback;
-(NSURLSessionTask*) forwardRaw : (NSString*) comment : (NSString*) toRecipients :  (void(^)(NSString* returnValue, MSODataException *error)) callback;
-(NSURLSessionTask*) send :  (void (^)(int returnValue, MSODataException *error)) callback;
-(NSURLSessionTask*) sendRaw :  (void(^)(NSString* returnValue, MSODataException *error)) callback;
@end