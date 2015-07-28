/*******************************************************************************
**NOTE** This code was generated by a tool and will occasionally be
overwritten. We welcome comments and issues regarding this code; they will be
addressed in the generation tool. If you wish to submit pull requests, please
do so for the templates in that tool.

This code was generated by Vipr (https://github.com/microsoft/vipr) using
the T4TemplateWriter (https://github.com/msopentech/vipr-t4templatewriter).

Copyright (c) Microsoft Open Technologies, Inc. All Rights Reserved.
Licensed under the Apache License 2.0; see LICENSE in the source repository
root for authoritative license information.﻿
******************************************************************************/

@class MSGraphEvent;

#import <Foundation/Foundation.h>
#import "MSOrcBaseEntity.h"

/**
* The header for type Calendar.
*/

@interface MSGraphCalendar : MSOrcBaseEntity

@property (copy, nonatomic, readwrite, getter=id, setter=setId:) NSString *Id;
@property (copy, nonatomic, readwrite, getter=name, setter=setName:) NSString *Name;
@property (copy, nonatomic, readwrite, getter=changeKey, setter=setChangeKey:) NSString *ChangeKey;
@property (copy, nonatomic, readwrite, getter=calendarView, setter=setCalendarView:) NSMutableArray *CalendarView;
@property (copy, nonatomic, readwrite, getter=events, setter=setEvents:) NSMutableArray *Events;

@end