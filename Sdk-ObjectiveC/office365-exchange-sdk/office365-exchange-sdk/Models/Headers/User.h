//  
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocols.h"

#import "Entity.h"



@class Folder;

@class Message;

@class Folder;

@class Folder;

@class Folder;

@class Folder;

@class Folder;

@class Calendar;

@class Calendar;

@class CalendarGroup;

@class Event;

@class Contact;

@class ContactFolder;

@interface User : Entity	


@property NSString *DisplayName;

@property NSString *Alias;

@property NSString *MailboxGuid;

@property NSMutableArray<Folder> *Folders;

@property NSMutableArray<Message> *Messages;

@property Folder *RootFolder;

@property Folder *Inbox;

@property Folder *Drafts;

@property Folder *SentItems;

@property Folder *DeletedItems;

@property NSMutableArray<Calendar> *Calendars;

@property Calendar *Calendar;

@property NSMutableArray<CalendarGroup> *CalendarGroups;

@property NSMutableArray<Event> *Events;

@property NSMutableArray<Contact> *Contacts;

@property NSMutableArray<ContactFolder> *ContactFolders;


@end