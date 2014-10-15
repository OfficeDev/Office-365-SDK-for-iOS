/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSORecurrencePattern;
@class MSORecurrenceRange;

#import <Foundation/Foundation.h>
#import "MSOProtocols.h"


/**
* The header for type PatternedRecurrence.
*/

@interface MSOPatternedRecurrence : NSObject

@property MSORecurrencePattern *Pattern;
@property MSORecurrenceRange *Range;

@end