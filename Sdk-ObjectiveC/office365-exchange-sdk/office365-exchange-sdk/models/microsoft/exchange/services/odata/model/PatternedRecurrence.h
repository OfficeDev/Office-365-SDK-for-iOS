//
//  PatternedRecurrence.h
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RecurrencePattern.h"
#import "RecurrenceRange.h"

@interface PatternedRecurrence : NSObject

@property RecurrencePattern * Pattern;
@property RecurrenceRange * Range;

@end