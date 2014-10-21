/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import "MSOODataEntityFetcher.h"
#import "MSOUserOperations.h"
#import "MSOUser.h"

@class MSOFolderCollectionFetcher;
@class MSOMessageCollectionFetcher;
@class MSOFolderFetcher;
@class MSOCalendarCollectionFetcher;
@class MSOCalendarFetcher;
@class MSOCalendarGroupCollectionFetcher;
@class MSOEventCollectionFetcher;
@class MSOContactCollectionFetcher;
@class MSOContactFolderCollectionFetcher;


/**
* The header for type MSOUserFetcher.
*/


@protocol MSOUserFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOUser* user, NSError *error))callback;

@end

@interface MSOUserFetcher : MSOODataEntityFetcher<MSOUserFetcher>

-(MSOUserOperations*) getOperations;

-(MSOFolderCollectionFetcher*) getFolders;
-(MSOMessageCollectionFetcher*) getMessages;
-(MSOFolderFetcher*) getRootFolder;
-(MSOCalendarCollectionFetcher*) getCalendars;
-(MSOCalendarFetcher*) getCalendar;
-(MSOCalendarGroupCollectionFetcher*) getCalendarGroups;
-(MSOEventCollectionFetcher*) getEvents;
-(MSOContactCollectionFetcher*) getContacts;
-(MSOContactFolderCollectionFetcher*) getContactFolders;
@end