//
//  User.h
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entity.h"
#import "Folder.h"
#import "Calendar.h"

@interface User : Entity

@property NSString * DisplayName;
@property NSString * Alias;
@property NSString * MailboxGuid;
@property NSMutableArray * Folders;
@property NSMutableArray * Messages;
@property Folder * RootFolder;
@property Folder * Inbox;
@property Folder * Drafts;
@property Folder * SentItems;
@property Folder * DeletedItems;
@property NSMutableArray * Calendars;
@property Calendar * Calendar;
@property NSMutableArray * CalendarGroups;
@property NSMutableArray * Events;
@property NSMutableArray * Contacts;
@property NSMutableArray * ContactFolders;

@end