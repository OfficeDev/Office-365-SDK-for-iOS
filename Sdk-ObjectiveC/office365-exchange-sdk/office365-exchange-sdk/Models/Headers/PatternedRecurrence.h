//  
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocols.h"



@class RecurrencePattern;

@class RecurrenceRange;

@interface PatternedRecurrence : NSObject	


@property RecurrencePattern *Pattern;

@property RecurrenceRange *Range;


@end