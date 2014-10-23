/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOUserFetcher.h"
#import "MSOFolderCollectionFetcher.h"
#import "MSOMessageCollectionFetcher.h"
#import "MSOFolderFetcher.h"
#import "MSOCalendarCollectionFetcher.h"
#import "MSOCalendarFetcher.h"
#import "MSOCalendarGroupCollectionFetcher.h"
#import "MSOEventCollectionFetcher.h"
#import "MSOEventCollectionFetcher.h"
#import "MSOContactCollectionFetcher.h"
#import "MSOContactFolderCollectionFetcher.h"


/**
* The implementation file for type MSOUserFetcher.
*/


@implementation MSOUserFetcher
-(MSOUserOperations*) getOperations{
	return [[MSOUserOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOUser class]];
}

-(MSOFolderCollectionFetcher*) getFolders{
    return [[MSOFolderCollectionFetcher alloc] initWith:@"Folders" :self : [MSOFolder class]];
}

-(MSOMessageCollectionFetcher*) getMessages{
    return [[MSOMessageCollectionFetcher alloc] initWith:@"Messages" :self : [MSOMessage class]];
}

-(MSOFolderFetcher*) getRootFolder{
	 return [[MSOFolderFetcher alloc] initWith:@"RootFolder" :self : [MSOFolder class]];
}

-(MSOCalendarCollectionFetcher*) getCalendars{
    return [[MSOCalendarCollectionFetcher alloc] initWith:@"Calendars" :self : [MSOCalendar class]];
}

-(MSOCalendarFetcher*) getCalendar{
	 return [[MSOCalendarFetcher alloc] initWith:@"Calendar" :self : [MSOCalendar class]];
}

-(MSOCalendarGroupCollectionFetcher*) getCalendarGroups{
    return [[MSOCalendarGroupCollectionFetcher alloc] initWith:@"CalendarGroups" :self : [MSOCalendarGroup class]];
}

-(MSOEventCollectionFetcher*) getEvents{
    return [[MSOEventCollectionFetcher alloc] initWith:@"Events" :self : [MSOEvent class]];
}

-(MSOEventCollectionFetcher*) getCalendarView{
    return [[MSOEventCollectionFetcher alloc] initWith:@"CalendarView" :self : [MSOEvent class]];
}

-(MSOContactCollectionFetcher*) getContacts{
    return [[MSOContactCollectionFetcher alloc] initWith:@"Contacts" :self : [MSOContact class]];
}

-(MSOContactFolderCollectionFetcher*) getContactFolders{
    return [[MSOContactFolderCollectionFetcher alloc] initWith:@"ContactFolders" :self : [MSOContactFolder class]];
}


@end