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

@end

@interface MSOutlookUserFetcher : MSODataEntityFetcher<MSOutlookUserFetcher>

-(MSOutlookUserOperations*) getOperations;

-(MSOutlookFolderCollectionFetcher*) getFolders;

-(MSOutlookMessageCollectionFetcher*) getMessages;

-(MSOutlookFolderFetcher*) getRootFolder;

-(MSOutlookCalendarCollectionFetcher*) getCalendars;

-(MSOutlookCalendarFetcher*) getCalendar;

-(MSOutlookCalendarGroupCollectionFetcher*) getCalendarGroups;

-(MSOutlookEventCollectionFetcher*) getEvents;

-(MSOutlookEventCollectionFetcher*) getCalendarView;

-(MSOutlookContactCollectionFetcher*) getContacts;

-(MSOutlookContactFolderCollectionFetcher*) getContactFolders;

	
@end