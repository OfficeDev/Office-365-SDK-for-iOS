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

#import <office365_odata_base/office365_odata_base.h>
#import "MSOutlookUserOperations.h"
#import "MSOutlookUser.h"
@class MSOutlookFolderCollectionFetcher;
@class MSOutlookMessageCollectionFetcher;
@class MSOutlookFolderFetcher;
@class MSOutlookCalendarCollectionFetcher;
@class MSOutlookCalendarFetcher;
@class MSOutlookCalendarGroupCollectionFetcher;
@class MSOutlookEventCollectionFetcher;
@class MSOutlookEventCollectionFetcher;
@class MSOutlookContactCollectionFetcher;
@class MSOutlookContactFolderCollectionFetcher;
@class MSOutlookMessageFetcher;
@class MSOutlookCalendarGroupFetcher;
@class MSOutlookEventFetcher;
@class MSOutlookContactFetcher;
@class MSOutlookContactFolderFetcher;
/**
* The header for type MSOutlookUserFetcher.
*/

@protocol MSOutlookUserFetcher

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSOutlookUser* user, MSODataException *error))callback;
-(NSURLSessionDataTask*) updateUser:(id)entity withCallback:(void (^)(MSOutlookUser*, MSODataException * error))callback;
-(NSURLSessionDataTask*) deleteUser:(void (^)(int status, MSODataException * error))callback;
-(id<MSOutlookUserFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSOutlookUserFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSOutlookUserFetcher>)select : (NSString*) params;
-(id<MSOutlookUserFetcher>)expand : (NSString*) value;
@end

@interface MSOutlookUserFetcher : MSODataEntityFetcher<MSOutlookUserFetcher>

-(MSOutlookUserOperations*) getOperations;

-(MSOutlookFolderCollectionFetcher*) getFolders;

-(MSOutlookFolderFetcher*) getFoldersById : (NSString*)_id;

-(MSOutlookMessageCollectionFetcher*) getMessages;

-(MSOutlookMessageFetcher*) getMessagesById : (NSString*)_id;

-(MSOutlookFolderFetcher*) getRootFolder;

-(MSOutlookCalendarCollectionFetcher*) getCalendars;

-(MSOutlookCalendarFetcher*) getCalendarsById : (NSString*)_id;

-(MSOutlookCalendarFetcher*) getCalendar;

-(MSOutlookCalendarGroupCollectionFetcher*) getCalendarGroups;

-(MSOutlookCalendarGroupFetcher*) getCalendarGroupsById : (NSString*)_id;

-(MSOutlookEventCollectionFetcher*) getEvents;

-(MSOutlookEventFetcher*) getEventsById : (NSString*)_id;

-(MSOutlookEventCollectionFetcher*) getCalendarView;

-(MSOutlookEventFetcher*) getCalendarViewById : (NSString*)_id;

-(MSOutlookContactCollectionFetcher*) getContacts;

-(MSOutlookContactFetcher*) getContactsById : (NSString*)_id;

-(MSOutlookContactFolderCollectionFetcher*) getContactFolders;

-(MSOutlookContactFolderFetcher*) getContactFoldersById : (NSString*)_id;

	
@end