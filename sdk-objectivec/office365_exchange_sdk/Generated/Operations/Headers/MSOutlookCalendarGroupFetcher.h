/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookODataEntityFetcher.h"
#import "MSOutlookCalendarGroupOperations.h"
#import "MSOutlookCalendarGroup.h"
@class MSOutlookCalendarCollectionFetcher;

/**
* The header for type MSOutlookCalendarGroupFetcher.
*/

@protocol MSOutlookCalendarGroupFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOutlookCalendarGroup* calendarGroup, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOutlookCalendarGroup*, NSError * error))callback;
@end

@interface MSOutlookCalendarGroupFetcher : MSOutlookODataEntityFetcher<MSOutlookCalendarGroupFetcher>

-(MSOutlookCalendarGroupOperations*) getOperations;
-(MSOutlookCalendarCollectionFetcher*) getCalendars;
	
@end