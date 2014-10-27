/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSOutlookRecurrencePattern;
@class MSOutlookRecurrenceRange;

#import <Foundation/Foundation.h>
#import "MSOutlookProtocols.h"


/**
* The header for type PatternedRecurrence.
*/

@interface MSOutlookPatternedRecurrence : NSObject

@property NSString *$$__ODataType;
@property MSOutlookRecurrencePattern *Pattern;
@property MSOutlookRecurrenceRange *Range;

@end