/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataEntityFetcher.h"
#import "MSOCalendarOperations.h"
#import "MSOCalendar.h"
@class MSOEventCollectionFetcher;
@class MSOEventCollectionFetcher;

/**
* The header for type MSOCalendarFetcher.
*/


@protocol MSOCalendarFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOCalendar* calendar, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOCalendar*, NSError * error))callback;
@end

@interface MSOCalendarFetcher : MSOODataEntityFetcher<MSOCalendarFetcher>

-(MSOCalendarOperations*) getOperations;

-(MSOEventCollectionFetcher*) getCalendarView;
-(MSOEventCollectionFetcher*) getEvents;
@end