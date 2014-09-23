//  
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocols.h"

#import "Item.h"



@class Recipient;

@class Recipient;

@class Recipient;

@class Recipient;

@class Recipient;

@class Recipient;

@class ItemBody;

@class MeetingMessageType;

@interface Message : Item	


-(id<Message>)getOperations;

@property id<Message> Operations;

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

@property MeetingMessageType *MeetingMessageType;

@property NSDate *DateTimeCreated;

@property NSDate *LastModifiedTime;


@end