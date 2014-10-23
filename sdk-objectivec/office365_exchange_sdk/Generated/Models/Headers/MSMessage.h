/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSImportance.h"
@class MSItemBody;
@class MSRecipient;
@class MSAttachment;

#import <Foundation/Foundation.h>
#import "MSProtocols.h"
#import "MSItem.h"

/**
* The header for type Message.
*/

@interface MSMessage : MSItem
@property NSString *Subject;
@property MSItemBody *Body;
@property NSString *BodyPreview;
@property MSImportance *Importance;
@property bool HasAttachments;
@property NSString *ParentFolderId;
@property MSRecipient *From;
@property MSRecipient *Sender;
@property NSMutableArray<MSRecipient> *ToRecipients;
@property NSMutableArray<MSRecipient> *CcRecipients;
@property NSMutableArray<MSRecipient> *BccRecipients;
@property NSMutableArray<MSRecipient> *ReplyTo;
@property NSString *ConversationId;
@property MSItemBody *UniqueBody;
@property NSDate *DateTimeReceived;
@property NSDate *DateTimeSent;
@property bool IsDeliveryReceiptRequested;
@property bool IsReadReceiptRequested;
@property bool IsDraft;
@property bool IsRead;

@end