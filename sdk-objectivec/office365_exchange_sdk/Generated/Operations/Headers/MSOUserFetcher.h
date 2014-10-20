/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataEntityFetcher.h"
#import "MSOUserOperations.h"
#import "MSOUser.h"

#import "MSOFolderCollectionFetcher.h"
#import "MSOMessageCollectionFetcher.h"
#import "MSOFolderFetcher.h"
#import "MSOCalendarCollectionFetcher.h"
#import "MSOCalendarFetcher.h"
#import "MSOCalendarGroupCollectionFetcher.h"
#import "MSOEventCollectionFetcher.h"
#import "MSOContactCollectionFetcher.h"
#import "MSOContactFolderCollectionFetcher.h"


/**
* The header for type MSOUserFetcher.
*/

@interface MSOUserFetcher : MSOODataEntityFetcher

-(MSOUserOperations*) getOperations;
-(NSURLSessionDataTask *)execute:(void (^)(MSOUser* user, NSError *error))callback;

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