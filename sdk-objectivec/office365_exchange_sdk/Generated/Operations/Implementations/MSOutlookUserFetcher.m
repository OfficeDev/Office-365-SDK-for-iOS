/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookUserFetcher.h"
#import "MSOutlookFolderCollectionFetcher.h"
#import "MSOutlookMessageCollectionFetcher.h"
#import "MSOutlookFolderFetcher.h"
#import "MSOutlookCalendarCollectionFetcher.h"
#import "MSOutlookCalendarFetcher.h"
#import "MSOutlookCalendarGroupCollectionFetcher.h"
#import "MSOutlookEventCollectionFetcher.h"
#import "MSOutlookEventCollectionFetcher.h"
#import "MSOutlookContactCollectionFetcher.h"
#import "MSOutlookContactFolderCollectionFetcher.h"


/**
* The implementation file for type MSOutlookUserFetcher.
*/


@implementation MSOutlookUserFetcher
-(MSOutlookUserOperations*) getOperations{
	return [[MSOutlookUserOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOutlookUser class]];
}

-(MSOutlookFolderCollectionFetcher*) getFolders{
    return [[MSOutlookFolderCollectionFetcher alloc] initWith:@"Folders" :self : [MSOutlookFolder class]];
}

-(MSOutlookMessageCollectionFetcher*) getMessages{
    return [[MSOutlookMessageCollectionFetcher alloc] initWith:@"Messages" :self : [MSOutlookMessage class]];
}

-(MSOutlookFolderFetcher*) getRootFolder{
	 return [[MSOutlookFolderFetcher alloc] initWith:@"RootFolder" :self : [MSOutlookFolder class]];
}

-(MSOutlookCalendarCollectionFetcher*) getCalendars{
    return [[MSOutlookCalendarCollectionFetcher alloc] initWith:@"Calendars" :self : [MSOutlookCalendar class]];
}

-(MSOutlookCalendarFetcher*) getCalendar{
	 return [[MSOutlookCalendarFetcher alloc] initWith:@"Calendar" :self : [MSOutlookCalendar class]];
}

-(MSOutlookCalendarGroupCollectionFetcher*) getCalendarGroups{
    return [[MSOutlookCalendarGroupCollectionFetcher alloc] initWith:@"CalendarGroups" :self : [MSOutlookCalendarGroup class]];
}

-(MSOutlookEventCollectionFetcher*) getEvents{
    return [[MSOutlookEventCollectionFetcher alloc] initWith:@"Events" :self : [MSOutlookEvent class]];
}

-(MSOutlookEventCollectionFetcher*) getCalendarView{
    return [[MSOutlookEventCollectionFetcher alloc] initWith:@"CalendarView" :self : [MSOutlookEvent class]];
}

-(MSOutlookContactCollectionFetcher*) getContacts{
    return [[MSOutlookContactCollectionFetcher alloc] initWith:@"Contacts" :self : [MSOutlookContact class]];
}

-(MSOutlookContactFolderCollectionFetcher*) getContactFolders{
    return [[MSOutlookContactFolderCollectionFetcher alloc] initWith:@"ContactFolders" :self : [MSOutlookContactFolder class]];
}


@end