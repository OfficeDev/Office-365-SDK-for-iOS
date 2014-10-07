/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "ODataOperations.h"
#import "Event.h"

@interface CalendarOperations : ODataOperations

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent;
-(NSURLSessionDataTask*)calendarView : (NSDate *) StartDate : (NSDate *) EndDate : (void (^)(Event *event, NSError *error))callback;			

@end