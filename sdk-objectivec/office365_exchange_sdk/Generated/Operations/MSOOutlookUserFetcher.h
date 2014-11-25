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
#import "MSOOutlookUserOperations.h"
#import "MSOOutlookUser.h"
@class MSOOutlookFolderCollectionFetcher;
@class MSOOutlookMessageCollectionFetcher;
@class MSOOutlookFolderFetcher;
@class MSOOutlookCalendarCollectionFetcher;
@class MSOOutlookCalendarFetcher;
@class MSOOutlookCalendarGroupCollectionFetcher;
@class MSOOutlookEventCollectionFetcher;
@class MSOOutlookEventCollectionFetcher;
@class MSOOutlookContactCollectionFetcher;
@class MSOOutlookContactFolderCollectionFetcher;


/**
* The header for type MSOOutlookUserFetcher.
*/

@protocol MSOOutlookUserFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOOutlookUser* user, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOOutlookUser*, NSError * error))callback;
@end

@interface MSOOutlookUserFetcher : MSODataEntityFetcher<MSOOutlookUserFetcher>

-(MSOOutlookUserOperations*) getOperations;

-(MSOOutlookFolderCollectionFetcher*) getFolders;

-(MSOOutlookMessageCollectionFetcher*) getMessages;

-(MSOOutlookFolderFetcher*) getRootFolder;

-(MSOOutlookCalendarCollectionFetcher*) getCalendars;

-(MSOOutlookCalendarFetcher*) getCalendar;

-(MSOOutlookCalendarGroupCollectionFetcher*) getCalendarGroups;

-(MSOOutlookEventCollectionFetcher*) getEvents;

-(MSOOutlookEventCollectionFetcher*) getCalendarView;

-(MSOOutlookContactCollectionFetcher*) getContacts;

-(MSOOutlookContactFolderCollectionFetcher*) getContactFolders;

	
@end