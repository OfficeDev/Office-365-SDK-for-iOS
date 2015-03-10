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

@class MSGraphServiceItemBody;
@class MSGraphServiceRecipient;
@class MSGraphServiceRecipient;
@class MSGraphServiceRecipient;
@class MSGraphServiceRecipient;
@class MSGraphServiceRecipient;
@class MSGraphServiceRecipient;
@class MSGraphServiceItemBody;


#import "MSGraphServiceProtocols.h"

#import <Foundation/Foundation.h>


/**
* The header for type Message.
*/

@interface MSGraphServiceMessage : NSObject

@property NSString *$$__ODataType;
@property NSString *Id;
@property NSString *Subject;
@property MSGraphServiceItemBody *Body;
@property NSString *BodyPreview;
@property NSString *Importance;
@property BOOL HasAttachments;
@property NSString *ParentFolderId;
@property MSGraphServiceRecipient *From;
@property MSGraphServiceRecipient *Sender;
@property NSMutableArray<MSGraphServiceRecipient> *ToRecipients;
@property NSMutableArray<MSGraphServiceRecipient> *CcRecipients;
@property NSMutableArray<MSGraphServiceRecipient> *BccRecipients;
@property NSMutableArray<MSGraphServiceRecipient> *ReplyTo;
@property NSString *ConversationId;
@property MSGraphServiceItemBody *UniqueBody;
@property NSDate *DateTimeReceived;
@property NSDate *DateTimeSent;
@property BOOL IsDeliveryReceiptRequested;
@property BOOL IsReadReceiptRequested;
@property BOOL IsDraft;
@property BOOL IsRead;

@end