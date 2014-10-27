/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

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
@property MSOutlookImportance *Importance;
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