//
//  RecurrencePatternType.h
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

@interface NSObject ()

typedef enum {
	RecurrencePatternType_Daily = 0,
	RecurrencePatternType_Weekly = 1,
	RecurrencePatternType_AbsoluteMonthly = 2,
	RecurrencePatternType_RelativeMonthly = 3,
	RecurrencePatternType_AbsoluteYearly = 4,
	RecurrencePatternType_RelativeYearly = 5,
} RecurrencePatternType;
@end

