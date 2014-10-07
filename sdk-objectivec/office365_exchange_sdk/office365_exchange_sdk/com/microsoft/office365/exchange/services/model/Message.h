/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "Protocols.h"
#import "Item.h"
@class ItemBody;
//@class Importance;
@class Recipient;
//@class MeetingMessageType;
@class Attachment;


@interface Message : Item	

@property NSString *Subject;
@property ItemBody *Body;
@property NSString *BodyPreview;
//@property Importance *Importance;
@property bool HasAttachments;
@property NSString *ParentFolderId;
@property Recipient *From;
@property Recipient *Sender;
@property NSMutableArray<Recipient> *ToRecipients;
@property NSMutableArray<Recipient> *CcRecipients;
@property NSMutableArray<Recipient> *BccRecipients;
@property NSMutableArray<Recipient> *ReplyTo;
@property NSString *ConversationId;
@property ItemBody *UniqueBody;
@property NSDate *DateTimeReceived;
@property NSDate *DateTimeSent;
@property bool IsDeliveryReceiptRequested;
@property bool IsReadReceiptRequested;
@property bool IsDraft;
@property bool IsRead;
@property NSString *EventId;
//@property MeetingMessageType *MeetingMessageType;

@end