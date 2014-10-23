/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"
#import "MSUserOperations.h"
#import "MSUser.h"
@class MSFolderCollectionFetcher;
@class MSMessageCollectionFetcher;
@class MSFolderFetcher;
@class MSCalendarCollectionFetcher;
@class MSCalendarFetcher;
@class MSCalendarGroupCollectionFetcher;
@class MSEventCollectionFetcher;
@class MSEventCollectionFetcher;
@class MSContactCollectionFetcher;
@class MSContactFolderCollectionFetcher;

/**
* The header for type MSUserFetcher.
*/

@protocol MSUserFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSUser* user, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSUser*, NSError * error))callback;
@end

@interface MSUserFetcher : MSODataEntityFetcher<MSUserFetcher>

-(MSUserOperations*) getOperations;
-(MSFolderCollectionFetcher*) getFolders;
-(MSMessageCollectionFetcher*) getMessages;
-(MSFolderFetcher*) getRootFolder;
-(MSCalendarCollectionFetcher*) getCalendars;
-(MSCalendarFetcher*) getCalendar;
-(MSCalendarGroupCollectionFetcher*) getCalendarGroups;
-(MSEventCollectionFetcher*) getEvents;
-(MSEventCollectionFetcher*) getCalendarView;
-(MSContactCollectionFetcher*) getContacts;
-(MSContactFolderCollectionFetcher*) getContactFolders;
	
@end