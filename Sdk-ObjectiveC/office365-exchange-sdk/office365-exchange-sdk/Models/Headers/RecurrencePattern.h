//  
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocols.h"



@class RecurrencePatternType;

@class DayOfWeek;

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