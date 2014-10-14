/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSORecurrenceRangeType.h"

#import <Foundation/Foundation.h>
#import "MSOProtocols.h"


@interface MSORecurrenceRange : NSObject
@property MSORecurrenceRangeType *Type;
@property NSDate *StartDate;
@property NSDate *EndDate;
@property int NumberOfOccurrences;

@end