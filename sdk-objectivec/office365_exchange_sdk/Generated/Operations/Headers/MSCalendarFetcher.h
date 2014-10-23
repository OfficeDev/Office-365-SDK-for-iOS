/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"
#import "MSCalendarOperations.h"
#import "MSCalendar.h"
@class MSEventCollectionFetcher;
@class MSEventCollectionFetcher;

/**
* The header for type MSCalendarFetcher.
*/

@protocol MSCalendarFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSCalendar* calendar, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSCalendar*, NSError * error))callback;
@end

@interface MSCalendarFetcher : MSODataEntityFetcher<MSCalendarFetcher>

-(MSCalendarOperations*) getOperations;
-(MSEventCollectionFetcher*) getCalendarView;
-(MSEventCollectionFetcher*) getEvents;
	
@end