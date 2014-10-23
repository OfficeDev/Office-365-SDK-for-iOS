/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSUserFetcher.h"
#import "MSFolderCollectionFetcher.h"
#import "MSMessageCollectionFetcher.h"
#import "MSFolderFetcher.h"
#import "MSCalendarCollectionFetcher.h"
#import "MSCalendarFetcher.h"
#import "MSCalendarGroupCollectionFetcher.h"
#import "MSEventCollectionFetcher.h"
#import "MSEventCollectionFetcher.h"
#import "MSContactCollectionFetcher.h"
#import "MSContactFolderCollectionFetcher.h"


/**
* The implementation file for type MSUserFetcher.
*/


@implementation MSUserFetcher
-(MSUserOperations*) getOperations{
	return [[MSUserOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSUser class]];
}

-(MSFolderCollectionFetcher*) getFolders{
    return [[MSFolderCollectionFetcher alloc] initWith:@"Folders" :self : [MSFolder class]];
}

-(MSMessageCollectionFetcher*) getMessages{
    return [[MSMessageCollectionFetcher alloc] initWith:@"Messages" :self : [MSMessage class]];
}

-(MSFolderFetcher*) getRootFolder{
	 return [[MSFolderFetcher alloc] initWith:@"RootFolder" :self : [MSFolder class]];
}

-(MSCalendarCollectionFetcher*) getCalendars{
    return [[MSCalendarCollectionFetcher alloc] initWith:@"Calendars" :self : [MSCalendar class]];
}

-(MSCalendarFetcher*) getCalendar{
	 return [[MSCalendarFetcher alloc] initWith:@"Calendar" :self : [MSCalendar class]];
}

-(MSCalendarGroupCollectionFetcher*) getCalendarGroups{
    return [[MSCalendarGroupCollectionFetcher alloc] initWith:@"CalendarGroups" :self : [MSCalendarGroup class]];
}

-(MSEventCollectionFetcher*) getEvents{
    return [[MSEventCollectionFetcher alloc] initWith:@"Events" :self : [MSEvent class]];
}

-(MSEventCollectionFetcher*) getCalendarView{
    return [[MSEventCollectionFetcher alloc] initWith:@"CalendarView" :self : [MSEvent class]];
}

-(MSContactCollectionFetcher*) getContacts{
    return [[MSContactCollectionFetcher alloc] initWith:@"Contacts" :self : [MSContact class]];
}

-(MSContactFolderCollectionFetcher*) getContactFolders{
    return [[MSContactFolderCollectionFetcher alloc] initWith:@"ContactFolders" :self : [MSContactFolder class]];
}


@end