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

@class MSOutlookFolder;
@class MSOutlookMessage;
@class MSOutlookFolder;
@class MSOutlookCalendar;
@class MSOutlookCalendar;
@class MSOutlookCalendarGroup;
@class MSOutlookEvent;
@class MSOutlookEvent;
@class MSOutlookContact;
@class MSOutlookContactFolder;


#import "MSOutlookProtocols.h"
#import "MSOutlookEntity.h"
#import <Foundation/Foundation.h>


/**
* The header for type User.
*/

@interface MSOutlookUser : MSOutlookEntity

@property NSString *DisplayName;
@property NSString *Alias;
@property NSString *MailboxGuid;
@property NSMutableArray<MSOutlookFolder> *Folders;
@property NSMutableArray<MSOutlookMessage> *Messages;
@property MSOutlookFolder *RootFolder;
@property NSMutableArray<MSOutlookCalendar> *Calendars;
@property MSOutlookCalendar *Calendar;
@property NSMutableArray<MSOutlookCalendarGroup> *CalendarGroups;
@property NSMutableArray<MSOutlookEvent> *Events;
@property NSMutableArray<MSOutlookEvent> *CalendarView;
@property NSMutableArray<MSOutlookContact> *Contacts;
@property NSMutableArray<MSOutlookContactFolder> *ContactFolders;

@end