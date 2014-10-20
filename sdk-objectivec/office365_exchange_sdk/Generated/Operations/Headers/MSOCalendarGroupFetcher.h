/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOCalendarGroupOperations.h"
#import "MSOCalendarGroup.h"

@class MSOCalendarCollectionFetcher;


/**
* The header for type MSOCalendarGroupFetcher.
*/

@interface MSOCalendarGroupFetcher : MSOODataEntityFetcher

-(MSOCalendarGroupOperations*) getOperations;
-(NSURLSessionDataTask *)execute:(void (^)(MSOCalendarGroup* calendarGroup, NSError *error))callback;

-(MSOCalendarCollectionFetcher*) getCalendars;
@end