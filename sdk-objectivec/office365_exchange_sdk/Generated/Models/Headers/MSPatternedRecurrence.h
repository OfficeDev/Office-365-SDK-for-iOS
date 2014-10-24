/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSRecurrencePattern;
@class MSRecurrenceRange;

#import <Foundation/Foundation.h>
#import "MSProtocols.h"


/**
* The header for type PatternedRecurrence.
*/

@interface MSPatternedRecurrence : NSObject
@property NSString *$$__ODataType;
@property MSRecurrencePattern *Pattern;
@property MSRecurrenceRange *Range;

@end