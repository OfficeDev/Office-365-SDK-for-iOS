/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "Protocols.h"
#import "Entity.h"
@class Folder;
@class Message;
@class Calendar;
@class CalendarGroup;
@class Event;
@class Contact;
@class ContactFolder;


@interface User : Entity	

@property NSString *DisplayName;
@property NSString *Alias;
@property NSString *MailboxGuid;

@end