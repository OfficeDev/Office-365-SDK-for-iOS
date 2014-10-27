/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSOutlookCalendar;

#import <Foundation/Foundation.h>
#import "MSOutlookProtocols.h"
#import "MSOutlookEntity.h"

/**
* The header for type CalendarGroup.
*/

@interface MSOutlookCalendarGroup : MSOutlookEntity
@property NSString *Name;
@property NSString *ChangeKey;
@property NSString *ClassId;

@end