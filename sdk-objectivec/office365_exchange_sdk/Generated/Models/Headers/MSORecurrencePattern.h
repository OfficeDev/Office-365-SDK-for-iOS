/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSORecurrencePatternType.h"
#import "MSOWeekIndex.h"
@class MSODayOfWeek;

#import <Foundation/Foundation.h>
#import "MSOProtocols.h"


/**
* The header for type RecurrencePattern.
*/

@interface MSORecurrencePattern : NSObject

@property MSORecurrencePatternType *Type;
@property int Interval;
@property int DayOfMonth;
@property int Month;
@property NSMutableArray<MSODayOfWeek> *DaysOfWeek;
@property MSODayOfWeek *FirstDayOfWeek;
@property MSOWeekIndex *Index;

@end