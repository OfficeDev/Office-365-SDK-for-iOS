/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookRecurrenceRangeType.h"

#import <Foundation/Foundation.h>
#import "MSOutlookProtocols.h"


/**
* The header for type RecurrenceRange.
*/

@interface MSOutlookRecurrenceRange : NSObject

@property NSString *$$__ODataType;
@property MSOutlookRecurrenceRangeType *Type;
@property NSDate *StartDate;
@property NSDate *EndDate;
@property int NumberOfOccurrences;

@end