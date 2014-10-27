/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookODataEntityFetcher.h"
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
-(NSURLSessionDataTask *)execute:(void (^)(MSOutlookUser* user, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOutlookUser*, NSError * error))callback;
@end

@interface MSOutlookUserFetcher : MSOutlookODataEntityFetcher<MSOutlookUserFetcher>

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