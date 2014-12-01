/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 *
 * Warning: This code was generated automatically. Edits will be overwritten.
 * To make changes to this code, please make changes to the generation framework itself:
 * https://github.com/MSOpenTech/odata-codegen
 *******************************************************************************/

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

@property MSOutlookRecurrencePatternType Type;
-(void)setTypeString:(NSString*)value;
@property int Interval;

@property int DayOfMonth;

@property int Month;

@property NSMutableArray<MSOutlookDayOfWeek>* DaysOfWeek;
@property MSOutlookDayOfWeek FirstDayOfWeek;
-(void)setFirstDayOfWeekString:(NSString*)value;
@property MSOutlookWeekIndex Index;
-(void)setIndexString:(NSString*)value;

@end