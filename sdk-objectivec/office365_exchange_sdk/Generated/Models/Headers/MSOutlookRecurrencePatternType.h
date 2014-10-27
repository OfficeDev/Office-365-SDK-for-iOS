/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@interface NSObject ()

typedef enum {
	Daily,
	Weekly,
	AbsoluteMonthly,
	RelativeMonthly,
	AbsoluteYearly,
	RelativeYearly
} MSOutlookRecurrencePatternType;

@end