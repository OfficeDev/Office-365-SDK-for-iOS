/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@implementation CalendarOperations

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent;

-(NSURLSessionDataTask*)calendarView : (NSDate *) StartDate : (NSDate *) EndDate : :(void (^)(Event d, NSError *error))callback;			
@end