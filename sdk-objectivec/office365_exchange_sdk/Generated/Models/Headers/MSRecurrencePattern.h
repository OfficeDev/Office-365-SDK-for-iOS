/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSRecurrencePatternType.h"
#import "MSDayOfWeek.h"
#import "MSWeekIndex.h"

#import <Foundation/Foundation.h>
#import "MSProtocols.h"


/**
* The header for type RecurrencePattern.
*/

@interface MSRecurrencePattern : NSObject
@property NSString *$$__ODataType;
@property MSRecurrencePatternType *Type;
@property int Interval;
@property int DayOfMonth;
@property int Month;
@property NSMutableArray<MSDayOfWeek> *DaysOfWeek;
@property MSDayOfWeek *FirstDayOfWeek;
@property MSWeekIndex *Index;

@end