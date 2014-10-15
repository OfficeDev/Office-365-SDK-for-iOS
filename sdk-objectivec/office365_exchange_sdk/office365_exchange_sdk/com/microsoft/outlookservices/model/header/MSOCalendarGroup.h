/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSOCalendar;

#import <Foundation/Foundation.h>
#import "MSOProtocols.h"
#import "MSOEntity.h"

/**
* The header for type CalendarGroup.
*/

@interface MSOCalendarGroup : MSOEntity
@property NSString *Name;
@property NSString *ChangeKey;
@property NSString *ClassId;

@end