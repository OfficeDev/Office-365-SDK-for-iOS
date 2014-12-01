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

#import "MSOutlookImportance.h"
@class MSOutlookItemBody;
@class MSOutlookRecipient;
@class MSOutlookAttachment;

#import <Foundation/Foundation.h>
#import "MSOutlookProtocols.h"
#import "MSOutlookItem.h"

/**
* The header for type Message.
*/

@interface MSOutlookMessage : MSOutlookItem


@property NSString *Subject;

@property MSOutlookItemBody *Body;

@property NSString *BodyPreview;

@property MSOutlookImportance Importance;

-(void)setImportanceString:(NSString*)value;
@property bool HasAttachments;

@property NSString *ParentFolderId;

@property MSOutlookRecipient *From;

@property MSOutlookRecipient *Sender;

@property NSMutableArray<MSOutlookRecipient> *ToRecipients;

@property NSMutableArray<MSOutlookRecipient> *CcRecipients;

@property NSMutableArray<MSOutlookRecipient> *BccRecipients;

@property NSMutableArray<MSOutlookRecipient> *ReplyTo;

@property NSString *ConversationId;

@property MSOutlookItemBody *UniqueBody;

@property NSDate *DateTimeReceived;

@property NSDate *DateTimeSent;

@property bool IsDeliveryReceiptRequested;

@property bool IsReadReceiptRequested;

@property bool IsDraft;

@property bool IsRead;


@end