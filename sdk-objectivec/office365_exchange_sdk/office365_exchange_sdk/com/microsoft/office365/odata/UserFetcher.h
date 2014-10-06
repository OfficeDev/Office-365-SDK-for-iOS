/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "UserFetcher.h"

@implementation UserFetcher

-(UserOperations*) getOperations{
    return (UserOperations*)[super getOperations];
}

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