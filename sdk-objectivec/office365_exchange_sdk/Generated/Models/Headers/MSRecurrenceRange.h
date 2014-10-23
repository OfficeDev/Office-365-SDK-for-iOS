/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSRecurrenceRangeType.h"

#import <Foundation/Foundation.h>
#import "MSProtocols.h"


/**
* The header for type RecurrenceRange.
*/

@interface MSRecurrenceRange : NSObject

@property MSRecurrenceRangeType *Type;
@property NSDate *StartDate;
@property NSDate *EndDate;
@property int NumberOfOccurrences;

@end