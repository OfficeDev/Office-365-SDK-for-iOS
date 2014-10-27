/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookRecurrencePatternType.h"
#import "MSOutlookDayOfWeek.h"
#import "MSOutlookWeekIndex.h"

#import <Foundation/Foundation.h>
#import "MSOutlookProtocols.h"


/**
* The header for type RecurrencePattern.
*/

@interface MSOutlookRecurrencePattern : NSObject

@property NSString *$$__ODataType;
@property MSOutlookRecurrencePatternType *Type;
@property int Interval;
@property int DayOfMonth;
@property int Month;
@property NSMutableArray<MSOutlookDayOfWeek> *DaysOfWeek;
@property MSOutlookDayOfWeek *FirstDayOfWeek;
@property MSOutlookWeekIndex *Index;

@end