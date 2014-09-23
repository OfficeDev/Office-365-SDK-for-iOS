//  
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

@interface NSObject ()

typedef enum {

	Daily,

	Weekly,

	AbsoluteMonthly,

	RelativeMonthly,

	AbsoluteYearly,

	RelativeYearly

} RecurrencePatternType;

@end