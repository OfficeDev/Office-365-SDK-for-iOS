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

#import "MSGraphServiceODataEntities.h"

@implementation MSGraphServiceUserFetcher

-(MSGraphServiceUserOperations*) getOperations{
	return [[MSGraphServiceUserOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataExecutable>)parent{
    self.Parent = parent;
    self.UrlComponent = urlComponent;

    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSGraphServiceUser class]];
}

-(NSURLSessionTask*) updateUser:(id)entity withCallback:(void (^)(MSGraphServiceUser*, MSODataException * error))callback{
	return [super update:entity : callback];
}

-(NSURLSessionTask*) deleteUser:(void (^)(int status, MSODataException * error))callback{
	return [super delete:callback];
}

-(MSGraphServiceAppRoleAssignmentCollectionFetcher*) getappRoleAssignments{
    return [[MSGraphServiceAppRoleAssignmentCollectionFetcher alloc] initWithUrl:@"appRoleAssignments" parent:self andEntityClass:[MSGraphServiceAppRoleAssignment class]];
}

-(id<MSGraphServiceAppRoleAssignmentFetcher>) getappRoleAssignmentsById : (NSString*)_id{
    return [[[MSGraphServiceAppRoleAssignmentCollectionFetcher alloc] initWithUrl:@"appRoleAssignments" parent:self andEntityClass:[MSGraphServiceAppRoleAssignment class]] getById:_id];
}
-(MSGraphServiceOAuth2PermissionGrantCollectionFetcher*) getoauth2PermissionGrants{
    return [[MSGraphServiceOAuth2PermissionGrantCollectionFetcher alloc] initWithUrl:@"oauth2PermissionGrants" parent:self andEntityClass:[MSGraphServiceOAuth2PermissionGrant class]];
}

-(id<MSGraphServiceOAuth2PermissionGrantFetcher>) getoauth2PermissionGrantsById : (NSString*)_id{
    return [[[MSGraphServiceOAuth2PermissionGrantCollectionFetcher alloc] initWithUrl:@"oauth2PermissionGrants" parent:self andEntityClass:[MSGraphServiceOAuth2PermissionGrant class]] getById:_id];
}
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getownedDevices{
    return [[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"ownedDevices" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]];
}

-(id<MSGraphServiceDirectoryObjectFetcher>) getownedDevicesById : (NSString*)_id{
    return [[[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"ownedDevices" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]] getById:_id];
}
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getregisteredDevices{
    return [[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"registeredDevices" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]];
}

-(id<MSGraphServiceDirectoryObjectFetcher>) getregisteredDevicesById : (NSString*)_id{
    return [[[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"registeredDevices" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]] getById:_id];
}
-(MSGraphServiceDirectoryObjectFetcher*) getmanager{
	 return [[MSGraphServiceDirectoryObjectFetcher alloc] initWithUrl:@"manager" parent:self andEntityClass: [MSGraphServiceDirectoryObject class]];
}
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getdirectReports{
    return [[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"directReports" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]];
}

-(id<MSGraphServiceDirectoryObjectFetcher>) getdirectReportsById : (NSString*)_id{
    return [[[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"directReports" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]] getById:_id];
}
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getmemberOf{
    return [[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"memberOf" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]];
}

-(id<MSGraphServiceDirectoryObjectFetcher>) getmemberOfById : (NSString*)_id{
    return [[[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"memberOf" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]] getById:_id];
}
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getcreatedObjects{
    return [[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"createdObjects" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]];
}

-(id<MSGraphServiceDirectoryObjectFetcher>) getcreatedObjectsById : (NSString*)_id{
    return [[[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"createdObjects" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]] getById:_id];
}
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getownedObjects{
    return [[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"ownedObjects" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]];
}

-(id<MSGraphServiceDirectoryObjectFetcher>) getownedObjectsById : (NSString*)_id{
    return [[[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"ownedObjects" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]] getById:_id];
}
-(MSGraphServiceEventCollectionFetcher*) getEvents{
    return [[MSGraphServiceEventCollectionFetcher alloc] initWithUrl:@"Events" parent:self andEntityClass:[MSGraphServiceEvent class]];
}

-(id<MSGraphServiceEventFetcher>) getEventsById : (NSString*)_id{
    return [[[MSGraphServiceEventCollectionFetcher alloc] initWithUrl:@"Events" parent:self andEntityClass:[MSGraphServiceEvent class]] getById:_id];
}
-(MSGraphServiceMessageCollectionFetcher*) getMessages{
    return [[MSGraphServiceMessageCollectionFetcher alloc] initWithUrl:@"Messages" parent:self andEntityClass:[MSGraphServiceMessage class]];
}

-(id<MSGraphServiceMessageFetcher>) getMessagesById : (NSString*)_id{
    return [[[MSGraphServiceMessageCollectionFetcher alloc] initWithUrl:@"Messages" parent:self andEntityClass:[MSGraphServiceMessage class]] getById:_id];
}
-(MSGraphServiceCalendarViewCollectionFetcher*) getCalendarView{
    return [[MSGraphServiceCalendarViewCollectionFetcher alloc] initWithUrl:@"CalendarView" parent:self andEntityClass:[MSGraphServiceCalendarView class]];
}

-(id<MSGraphServiceCalendarViewFetcher>) getCalendarViewById : (NSString*)_id{
    return [[[MSGraphServiceCalendarViewCollectionFetcher alloc] initWithUrl:@"CalendarView" parent:self andEntityClass:[MSGraphServiceCalendarView class]] getById:_id];
}
-(MSGraphServiceCalendarCollectionFetcher*) getCalendars{
    return [[MSGraphServiceCalendarCollectionFetcher alloc] initWithUrl:@"Calendars" parent:self andEntityClass:[MSGraphServiceCalendar class]];
}

-(id<MSGraphServiceCalendarFetcher>) getCalendarsById : (NSString*)_id{
    return [[[MSGraphServiceCalendarCollectionFetcher alloc] initWithUrl:@"Calendars" parent:self andEntityClass:[MSGraphServiceCalendar class]] getById:_id];
}
-(MSGraphServiceCalendarFetcher*) getCalendar{
	 return [[MSGraphServiceCalendarFetcher alloc] initWithUrl:@"Calendar" parent:self andEntityClass: [MSGraphServiceCalendar class]];
}
-(MSGraphServiceCalendarGroupCollectionFetcher*) getCalendarGroups{
    return [[MSGraphServiceCalendarGroupCollectionFetcher alloc] initWithUrl:@"CalendarGroups" parent:self andEntityClass:[MSGraphServiceCalendarGroup class]];
}

-(id<MSGraphServiceCalendarGroupFetcher>) getCalendarGroupsById : (NSString*)_id{
    return [[[MSGraphServiceCalendarGroupCollectionFetcher alloc] initWithUrl:@"CalendarGroups" parent:self andEntityClass:[MSGraphServiceCalendarGroup class]] getById:_id];
}
-(MSGraphServiceDriveFetcher*) getdrive{
	 return [[MSGraphServiceDriveFetcher alloc] initWithUrl:@"drive" parent:self andEntityClass: [MSGraphServiceDrive class]];
}
-(MSGraphServiceItemCollectionFetcher*) getfiles{
    return [[MSGraphServiceItemCollectionFetcher alloc] initWithUrl:@"files" parent:self andEntityClass:[MSGraphServiceItem class]];
}

-(id<MSGraphServiceItemFetcher>) getfilesById : (NSString*)_id{
    return [[[MSGraphServiceItemCollectionFetcher alloc] initWithUrl:@"files" parent:self andEntityClass:[MSGraphServiceItem class]] getById:_id];
}

@end