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

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent{
    
    return [super initWith:urlComponent :parent :[User class] :[UserOperations class]];
}
-(FolderCollectionFetcher*) getFolders{
    return [[FolderCollectionFetcher alloc] initWith:@"Folders" :self :[Folder class] : [FolderCollectionOperations class]];
}
-(MessageCollectionFetcher*) getMessages{
    return [[MessageCollectionFetcher alloc] initWith:@"Messages" :self :[Message class] : [MessageCollectionOperations class]];
}
-(FolderFetcher) getRootFolder{

    return [[FolderFetcher alloc] initWith:@"RootFolder" :self :[Folder class] : [FolderrOperations class]];
}
-(CalendarCollectionFetcher*) getCalendars{
    return [[CalendarCollectionFetcher alloc] initWith:@"Calendars" :self :[Calendar class] : [CalendarCollectionOperations class]];
}
-(CalendarFetcher) getCalendar{

    return [[CalendarFetcher alloc] initWith:@"Calendar" :self :[Calendar class] : [CalendarrOperations class]];
}
-(CalendarGroupCollectionFetcher*) getCalendarGroups{
    return [[CalendarGroupCollectionFetcher alloc] initWith:@"CalendarGroups" :self :[CalendarGroup class] : [CalendarGroupCollectionOperations class]];
}
-(EventCollectionFetcher*) getEvents{
    return [[EventCollectionFetcher alloc] initWith:@"Events" :self :[Event class] : [EventCollectionOperations class]];
}
-(ContactCollectionFetcher*) getContacts{
    return [[ContactCollectionFetcher alloc] initWith:@"Contacts" :self :[Contact class] : [ContactCollectionOperations class]];
}
-(ContactFolderCollectionFetcher*) getContactFolders{
    return [[ContactFolderCollectionFetcher alloc] initWith:@"ContactFolders" :self :[ContactFolder class] : [ContactFolderCollectionOperations class]];
}
@end