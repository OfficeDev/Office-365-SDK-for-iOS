/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "ODataEntityFetcher.h"
#import "FoldersCollectionFetcher.h"
#import "MessagesCollectionFetcher.h"
#import "RootFolderFetcher.h"
#import "CalendarsCollectionFetcher.h"
#import "CalendarFetcher.h"
#import "CalendarGroupsCollectionFetcher.h"
#import "EventsCollectionFetcher.h"
#import "ContactsCollectionFetcher.h"
#import "ContactFoldersCollectionFetcher.h"

@interface UserFetcher : ODataEntityFetcher

-(UserOperations*) getOperations;

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent;
-(FolderCollectionFetcher*) getFolders;
-(MessageCollectionFetcher*) getMessages;
-(FolderFetcher*) getRootFolder;
-(CalendarCollectionFetcher*) getCalendars;
-(CalendarFetcher*) getCalendar;
-(CalendarGroupCollectionFetcher*) getCalendarGroups;
-(EventCollectionFetcher*) getEvents;
-(ContactCollectionFetcher*) getContacts;
-(ContactFolderCollectionFetcher*) getContactFolders;
@end