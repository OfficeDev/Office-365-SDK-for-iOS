//  
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocols.h"

#import "Entity.h"



@class Calendar;

@interface CalendarGroup : Entity	


@property NSString *Name;

@property NSString *ChangeKey;

@property NSString *ClassId;

@property NSMutableArray<Calendar> *Calendars;


@end