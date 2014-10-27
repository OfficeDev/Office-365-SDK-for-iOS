/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookODataEntityFetcher.h"
#import "MSOutlookCalendarOperations.h"
#import "MSOutlookCalendar.h"
@class MSOutlookEventCollectionFetcher;
@class MSOutlookEventCollectionFetcher;

/**
* The header for type MSOutlookCalendarFetcher.
*/

@protocol MSOutlookCalendarFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOutlookCalendar* calendar, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOutlookCalendar*, NSError * error))callback;
@end

@interface MSOutlookCalendarFetcher : MSOutlookODataEntityFetcher<MSOutlookCalendarFetcher>

-(MSOutlookCalendarOperations*) getOperations;
-(MSOutlookEventCollectionFetcher*) getCalendarView;
-(MSOutlookEventCollectionFetcher*) getEvents;
	
@end