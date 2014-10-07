/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "Protocols.h"
@class RecurrencePatternType;
@class DayOfWeek;
@class WeekIndex;


@interface RecurrencePattern : NSObject	

@property RecurrencePatternType *Type;
@property int Interval;
@property int DayOfMonth;
@property int Month;
@property NSMutableArray<DayOfWeek> *DaysOfWeek;
@property DayOfWeek *FirstDayOfWeek;
@property WeekIndex *Index;

@end