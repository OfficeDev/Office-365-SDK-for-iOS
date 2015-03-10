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

@class MSOutlookFolderFetcher;;
@class MSOutlookFolderCollectionFetcher;;
@class MSOutlookMessageFetcher;;
@class MSOutlookMessageCollectionFetcher;;
@class MSOutlookCalendarFetcher;;
@class MSOutlookCalendarCollectionFetcher;;
@class MSOutlookCalendarGroupFetcher;;
@class MSOutlookCalendarGroupCollectionFetcher;;
@class MSOutlookEventFetcher;;
@class MSOutlookEventCollectionFetcher;;
@class MSOutlookContactFetcher;;
@class MSOutlookContactCollectionFetcher;;
@class MSOutlookContactFolderFetcher;;
@class MSOutlookContactFolderCollectionFetcher;;
@class MSOutlookUserOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSOutlookModels.h"

/**
* The header for type MSOutlookUserFetcher.
*/


@protocol MSOutlookUserFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSOutlookUser* user, MSODataException *error))callback;
-(NSURLSessionTask*) updateUser:(id)entity withCallback:(void (^)(MSOutlookUser*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteUser:(void (^)(int status, MSODataException * error))callback;
-(id<MSOutlookUserFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSOutlookUserFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSOutlookUserFetcher>)select : (NSString*) params;
-(id<MSOutlookUserFetcher>)expand : (NSString*) value;

@required
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

@interface MSOutlookUserFetcher : MSODataEntityFetcher<MSOutlookUserFetcher>

@end