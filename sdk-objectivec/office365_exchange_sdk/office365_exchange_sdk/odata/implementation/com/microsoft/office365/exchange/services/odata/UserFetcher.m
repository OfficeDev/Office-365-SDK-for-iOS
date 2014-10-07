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
    
    return [super initWith:urlComponent :parent :[super.class classForClassName:@"User"] :[UserOperations class]];
}

-(FolderCollectionFetcher*) getFolders{
    return[[FolderCollectionFetcher alloc] initWith:@"Folders" :self :[super.class classForClassName:@"Folder"]   :[super.class classForClassName:@"FolderCollectionOperations"]];
}

/*
-(MessageCollectionFetcher*) getMessages{
    return [[MessageCollectionFetcher alloc] initWith:@"Messages" :self :[super.class classForClassName:@"Message"]  : [MessageCollectionOperations class]];
}
-(FolderFetcher) getRootFolder{

    return [[FolderFetcher alloc] initWith:@"RootFolder" :self :[super.class classForClassName:@"Folder"] : [FolderrOperations class]];
}
-(CalendarCollectionFetcher*) getCalendars{
    return [[CalendarCollectionFetcher alloc] initWith:@"Calendars" :self :[super.class classForClassName:@"Calendar"]  : [CalendarCollectionOperations class]];
}
-(CalendarFetcher) getCalendar{

    return [[CalendarFetcher alloc] initWith:@"Calendar" :self :[super.class classForClassName:@"Calendar"] : [CalendarrOperations class]];
}
-(CalendarGroupCollectionFetcher*) getCalendarGroups{
    return [[CalendarGroupCollectionFetcher alloc] initWith:@"CalendarGroups" :self :[super.class classForClassName:@"CalendarGroup"]  : [CalendarGroupCollectionOperations class]];
}
-(EventCollectionFetcher*) getEvents{
    return [[EventCollectionFetcher alloc] initWith:@"Events" :self :[super.class classForClassName:@"Event"]  : [EventCollectionOperations class]];
}
-(ContactCollectionFetcher*) getContacts{
    return [[ContactCollectionFetcher alloc] initWith:@"Contacts" :self :[super.class classForClassName:@"Contact"]  : [ContactCollectionOperations class]];
}
-(ContactFolderCollectionFetcher*) getContactFolders{
    return [[ContactFolderCollectionFetcher alloc] initWith:@"ContactFolders" :self :[super.class classForClassName:@"ContactFolder"]  : [ContactFolderCollectionOperations class]];
}*/
@end