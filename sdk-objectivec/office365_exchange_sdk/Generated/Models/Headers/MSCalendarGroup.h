/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSCalendar;

#import <Foundation/Foundation.h>
#import "MSProtocols.h"
#import "MSEntity.h"

/**
* The header for type CalendarGroup.
*/

@interface MSCalendarGroup : MSEntity
@property NSString *Name;
@property NSString *ChangeKey;
@property NSString *ClassId;

@end