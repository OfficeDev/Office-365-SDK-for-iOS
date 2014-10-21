/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import "MSOODataEntityFetcher.h"
#import "MSOCalendarGroupOperations.h"
#import "MSOCalendarGroup.h"

@class MSOCalendarCollectionFetcher;


/**
* The header for type MSOCalendarGroupFetcher.
*/


@protocol MSOCalendarGroupFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOCalendarGroup* calendarGroup, NSError *error))callback;

@end

@interface MSOCalendarGroupFetcher : MSOODataEntityFetcher<MSOCalendarGroupFetcher>

-(MSOCalendarGroupOperations*) getOperations;

-(MSOCalendarCollectionFetcher*) getCalendars;
@end