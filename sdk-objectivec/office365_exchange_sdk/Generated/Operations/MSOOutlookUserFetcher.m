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

#import "MSOOutlookUserFetcher.h"
#import "MSOOutlookFolderCollectionFetcher.h"
#import "MSOOutlookMessageCollectionFetcher.h"
#import "MSOOutlookFolderFetcher.h"
#import "MSOOutlookCalendarCollectionFetcher.h"
#import "MSOOutlookCalendarFetcher.h"
#import "MSOOutlookCalendarGroupCollectionFetcher.h"
#import "MSOOutlookEventCollectionFetcher.h"
#import "MSOOutlookEventCollectionFetcher.h"
#import "MSOOutlookContactCollectionFetcher.h"
#import "MSOOutlookContactFolderCollectionFetcher.h"


/**
* The implementation file for type MSOOutlookUserFetcher.
*/


@implementation MSOOutlookUserFetcher

-(MSOOutlookUserOperations*) getOperations{
	return [[MSOOutlookUserOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataReadable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSOOutlookUser class]];
}


-(MSOOutlookFolderCollectionFetcher*) getFolders{
    return [[MSOOutlookFolderCollectionFetcher alloc] initWithUrl:@"Folders" parent:self andEntityClass:[MSOOutlookFolder class]];
}


-(MSOOutlookMessageCollectionFetcher*) getMessages{
    return [[MSOOutlookMessageCollectionFetcher alloc] initWithUrl:@"Messages" parent:self andEntityClass:[MSOOutlookMessage class]];
}


-(MSOOutlookFolderFetcher*) getRootFolder{
	 return [[MSOOutlookFolderFetcher alloc] initWithUrl:@"RootFolder" parent:self andEntityClass: [MSOOutlookFolder class]];
}


-(MSOOutlookCalendarCollectionFetcher*) getCalendars{
    return [[MSOOutlookCalendarCollectionFetcher alloc] initWithUrl:@"Calendars" parent:self andEntityClass:[MSOOutlookCalendar class]];
}


-(MSOOutlookCalendarFetcher*) getCalendar{
	 return [[MSOOutlookCalendarFetcher alloc] initWithUrl:@"Calendar" parent:self andEntityClass: [MSOOutlookCalendar class]];
}


-(MSOOutlookCalendarGroupCollectionFetcher*) getCalendarGroups{
    return [[MSOOutlookCalendarGroupCollectionFetcher alloc] initWithUrl:@"CalendarGroups" parent:self andEntityClass:[MSOOutlookCalendarGroup class]];
}


-(MSOOutlookEventCollectionFetcher*) getEvents{
    return [[MSOOutlookEventCollectionFetcher alloc] initWithUrl:@"Events" parent:self andEntityClass:[MSOOutlookEvent class]];
}


-(MSOOutlookEventCollectionFetcher*) getCalendarView{
    return [[MSOOutlookEventCollectionFetcher alloc] initWithUrl:@"CalendarView" parent:self andEntityClass:[MSOOutlookEvent class]];
}


-(MSOOutlookContactCollectionFetcher*) getContacts{
    return [[MSOOutlookContactCollectionFetcher alloc] initWithUrl:@"Contacts" parent:self andEntityClass:[MSOOutlookContact class]];
}


-(MSOOutlookContactFolderCollectionFetcher*) getContactFolders{
    return [[MSOOutlookContactFolderCollectionFetcher alloc] initWithUrl:@"ContactFolders" parent:self andEntityClass:[MSOOutlookContactFolder class]];
}


@end