/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOCalendar.h"
#import "MSOODataOperations.h"
#import "MSOEvent.h"


/**
* The header for type MSOCalendarOperations.
*/

@interface MSOCalendarOperations : MSOODataOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;
-(NSURLSessionDataTask*)calendarView : (NSDate *) startDate : (NSDate *) endDate : (void (^)(MSOEvent *event, NSError *error))callback;			

@end