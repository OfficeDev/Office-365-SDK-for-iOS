/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataEntityFetcher.h"
#import "MSOCalendarOperations.h"
#import "MSOCalendar.h"

@class MSOEventCollectionFetcher;


/**
* The header for type MSOCalendarFetcher.
*/

@interface MSOCalendarFetcher : MSOODataEntityFetcher

-(MSOCalendarOperations*) getOperations;
-(NSURLSessionDataTask *)execute:(void (^)(MSOCalendar* calendar, NSError *error))callback;

-(MSOEventCollectionFetcher*) getEvents;
@end