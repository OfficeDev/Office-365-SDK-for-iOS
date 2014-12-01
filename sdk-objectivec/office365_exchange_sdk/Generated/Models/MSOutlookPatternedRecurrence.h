/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 *
 * Warning: This code was generated automatically. Edits will be overwritten.
 * To make changes to this code, please make changes to the generation framework itself:
 * https://github.com/MSOpenTech/odata-codegen
 *******************************************************************************/

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