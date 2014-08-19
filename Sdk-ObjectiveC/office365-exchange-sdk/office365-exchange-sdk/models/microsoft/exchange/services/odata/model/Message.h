//
//  Message.h
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"
#import "Recipient.h"
#import "ItemBody.h"
#import "MeetingMessageType.h"

@interface Message : Item

@property NSString * ParentFolderId;
@property Recipient * From;
@property Recipient * Sender;
@property NSMutableArray * ToRecipients;
@property NSMutableArray * CcRecipients;
@property NSMutableArray * BccRecipients;
@property NSMutableArray * ReplyTo;
@property NSString * ConversationId;
@property ItemBody * UniqueBody;
@property NSDate * DateTimeReceived;
@property NSDate * DateTimeSent;
@property bool IsDeliveryReceiptRequested;
@property bool IsReadReceiptRequested;
@property bool IsDraft;
@property bool IsRead;
@property NSString * EventId;
@property enum MeetingMessageType * MeetingMessageType;
@property NSDate * DateTimeCreated;
@property NSDate * LastModifiedTime;

@end