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

@class MSGraphServiceAppRoleAssignmentFetcher;;
@class MSGraphServiceAppRoleAssignmentCollectionFetcher;;
@class MSGraphServiceOAuth2PermissionGrantFetcher;;
@class MSGraphServiceOAuth2PermissionGrantCollectionFetcher;;
@class MSGraphServiceDirectoryObjectFetcher;;
@class MSGraphServiceDirectoryObjectCollectionFetcher;;
@class MSGraphServiceEventFetcher;;
@class MSGraphServiceEventCollectionFetcher;;
@class MSGraphServiceMessageFetcher;;
@class MSGraphServiceMessageCollectionFetcher;;
@class MSGraphServiceCalendarViewFetcher;;
@class MSGraphServiceCalendarViewCollectionFetcher;;
@class MSGraphServiceCalendarFetcher;;
@class MSGraphServiceCalendarCollectionFetcher;;
@class MSGraphServiceCalendarGroupFetcher;;
@class MSGraphServiceCalendarGroupCollectionFetcher;;
@class MSGraphServiceDriveFetcher;;
@class MSGraphServiceItemFetcher;;
@class MSGraphServiceItemCollectionFetcher;;
@class MSGraphServiceUserOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceUserFetcher.
*/


@protocol MSGraphServiceUserFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSGraphServiceUser* user, MSODataException *error))callback;
-(NSURLSessionTask*) updateUser:(id)entity withCallback:(void (^)(MSGraphServiceUser*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteUser:(void (^)(int status, MSODataException * error))callback;
-(id<MSGraphServiceUserFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceUserFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSGraphServiceUserFetcher>)select : (NSString*) params;
-(id<MSGraphServiceUserFetcher>)expand : (NSString*) value;

@required
-(MSGraphServiceUserOperations*) getOperations;
-(MSGraphServiceAppRoleAssignmentCollectionFetcher*) getappRoleAssignments;

-(MSGraphServiceAppRoleAssignmentFetcher*) getappRoleAssignmentsById : (NSString*)_id;
-(MSGraphServiceOAuth2PermissionGrantCollectionFetcher*) getoauth2PermissionGrants;

-(MSGraphServiceOAuth2PermissionGrantFetcher*) getoauth2PermissionGrantsById : (NSString*)_id;
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getownedDevices;

-(MSGraphServiceDirectoryObjectFetcher*) getownedDevicesById : (NSString*)_id;
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getregisteredDevices;

-(MSGraphServiceDirectoryObjectFetcher*) getregisteredDevicesById : (NSString*)_id;
-(MSGraphServiceDirectoryObjectFetcher*) getmanager;
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getdirectReports;

-(MSGraphServiceDirectoryObjectFetcher*) getdirectReportsById : (NSString*)_id;
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getmemberOf;

-(MSGraphServiceDirectoryObjectFetcher*) getmemberOfById : (NSString*)_id;
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getcreatedObjects;

-(MSGraphServiceDirectoryObjectFetcher*) getcreatedObjectsById : (NSString*)_id;
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getownedObjects;

-(MSGraphServiceDirectoryObjectFetcher*) getownedObjectsById : (NSString*)_id;
-(MSGraphServiceEventCollectionFetcher*) getEvents;

-(MSGraphServiceEventFetcher*) getEventsById : (NSString*)_id;
-(MSGraphServiceMessageCollectionFetcher*) getMessages;

-(MSGraphServiceMessageFetcher*) getMessagesById : (NSString*)_id;
-(MSGraphServiceCalendarViewCollectionFetcher*) getCalendarView;

-(MSGraphServiceCalendarViewFetcher*) getCalendarViewById : (NSString*)_id;
-(MSGraphServiceCalendarCollectionFetcher*) getCalendars;

-(MSGraphServiceCalendarFetcher*) getCalendarsById : (NSString*)_id;
-(MSGraphServiceCalendarFetcher*) getCalendar;
-(MSGraphServiceCalendarGroupCollectionFetcher*) getCalendarGroups;

-(MSGraphServiceCalendarGroupFetcher*) getCalendarGroupsById : (NSString*)_id;
-(MSGraphServiceDriveFetcher*) getdrive;
-(MSGraphServiceItemCollectionFetcher*) getfiles;

-(MSGraphServiceItemFetcher*) getfilesById : (NSString*)_id;
@end

@interface MSGraphServiceUserFetcher : MSODataEntityFetcher<MSGraphServiceUserFetcher>

@end