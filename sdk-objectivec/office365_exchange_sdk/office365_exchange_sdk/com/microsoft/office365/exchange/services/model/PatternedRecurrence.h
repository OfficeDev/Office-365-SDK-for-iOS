/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "Protocols.h"
@class RecurrencePattern;
@class RecurrenceRange;


@interface PatternedRecurrence : NSObject	

@property RecurrencePattern *Pattern;
@property RecurrenceRange *Range;

@end