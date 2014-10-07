/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "Protocols.h"
@class RecurrenceRangeType;


@interface RecurrenceRange : NSObject	

@property RecurrenceRangeType *Type;
@property NSDate *StartDate;
@property NSDate *EndDate;
@property int NumberOfOccurrences;

@end