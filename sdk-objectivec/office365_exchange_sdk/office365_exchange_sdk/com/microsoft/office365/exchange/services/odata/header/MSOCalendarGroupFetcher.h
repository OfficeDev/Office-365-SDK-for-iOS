/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataEntityFetcher.h"
#import "MSOCalendarGroupOperations.h"
#import "MSOCalendarGroup.h"

@class MSOCalendarCollectionFetcher;

@interface MSOCalendarGroupFetcher : MSOODataEntityFetcher

-(MSOCalendarGroupOperations*) getOperations;
-(NSURLSessionDataTask *)execute:(void (^)(MSOCalendarGroup* calendarGroup, NSError *error))callback;

-(MSOCalendarCollectionFetcher*) getCalendars;
@end