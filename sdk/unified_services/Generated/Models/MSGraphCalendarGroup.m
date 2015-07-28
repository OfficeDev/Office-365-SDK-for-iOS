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

#import "MSGraphModels.h"

/**
* The implementation file for type MSGraphCalendarGroup.
*/

@implementation MSGraphCalendarGroup	

@synthesize odataType = _odataType;
@synthesize Id = _id;
@synthesize Name = _name;
@synthesize ChangeKey = _changeKey;
@synthesize ClassId = _classId;
@synthesize Calendars = _calendars;

- (instancetype)init {

	if (self = [super init]) {

		_odataType = @"#Microsoft.Graph.CalendarGroup";
		_calendars = [[NSMutableArray alloc] initWithCollectionType:@"MSGraphCalendar"];
    }

	return self;
}

- (void)setId:(NSString *) id {
    _id = id;
	[self valueChanged:id forProperty:@"Id"];
}
    
- (void)setName:(NSString *) name {
    _name = name;
	[self valueChanged:name forProperty:@"Name"];
}
    
- (void)setChangeKey:(NSString *) changeKey {
    _changeKey = changeKey;
	[self valueChanged:changeKey forProperty:@"ChangeKey"];
}
    
- (void)setClassId:(NSString *) classId {
    _classId = classId;
	[self valueChanged:classId forProperty:@"ClassId"];
}
    
- (void)setCalendars:(NSMutableArray *) calendars {
    _calendars = calendars;
	[self valueChanged:calendars forProperty:@"Calendars"];
}
    
@end