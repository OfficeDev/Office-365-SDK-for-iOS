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


#import "MSGraphServiceProtocols.h"

#import <Foundation/Foundation.h>


/**
* The header for type RecurrencePattern.
*/

@interface MSGraphServiceRecurrencePattern : NSObject

@property NSString *$$__ODataType;
@property NSString *Type;
@property int Interval;
@property int DayOfMonth;
@property int Month;
@property NSMutableArray *DaysOfWeek;
@property NSString *FirstDayOfWeek;
@property NSString *Index;

@end