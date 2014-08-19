//
//  RecurrenceRange.h
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RecurrenceRangeType.h"

@interface RecurrenceRange : NSObject

@property enum RecurrenceRangeType * Type;
@property NSDate * StartDate;
@property NSDate * EndDate;
@property int NumberOfOccurrences;

@end