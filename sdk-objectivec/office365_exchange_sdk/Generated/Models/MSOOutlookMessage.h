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

#import "MSOOutlookImportance.h"
@class MSOOutlookItemBody;
@class MSOOutlookRecipient;
@class MSOOutlookAttachment;

#import <Foundation/Foundation.h>
#import "MSOOutlookProtocols.h"
#import "MSOOutlookItem.h"

/**
* The header for type Message.
*/

@interface MSOOutlookMessage : MSOOutlookItem


@property NSString *Subject;

@property MSOOutlookItemBody *Body;

@property NSString *BodyPreview;

@property MSOOutlookImportance *Importance;

@property bool HasAttachments;

@property NSString *ParentFolderId;

@property MSOOutlookRecipient *From;

@property MSOOutlookRecipient *Sender;

@property NSMutableArray<MSOOutlookRecipient> *ToRecipients;

@property NSMutableArray<MSOOutlookRecipient> *CcRecipients;

@property NSMutableArray<MSOOutlookRecipient> *BccRecipients;

@property NSMutableArray<MSOOutlookRecipient> *ReplyTo;

@property NSString *ConversationId;

@property MSOOutlookItemBody *UniqueBody;

@property NSDate *DateTimeReceived;

@property NSDate *DateTimeSent;

@property bool IsDeliveryReceiptRequested;

@property bool IsReadReceiptRequested;

@property bool IsDraft;

@property bool IsRead;


@end