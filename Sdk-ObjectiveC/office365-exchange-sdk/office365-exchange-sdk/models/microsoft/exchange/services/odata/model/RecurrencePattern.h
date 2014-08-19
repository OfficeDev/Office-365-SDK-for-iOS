//
//  RecurrencePattern.h
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RecurrencePatternType.h"
#import "DayOfWeek.h"
#import "WeekIndex.h"

@interface RecurrencePattern : NSObject

@property enum RecurrencePatternType * Type;
@property int Interval;
@property int DayOfMonth;
@property int Month;
@property NSMutableArray * DaysOfWeek;
@property enum DayOfWeek * FirstDayOfWeek;
@property enum WeekIndex * Index;

@end