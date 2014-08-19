//
//  CalendarGroup.h
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entity.h"

@interface CalendarGroup : Entity

@property NSString * Name;
@property NSString * ChangeKey;
@property NSString * ClassId;
@property NSMutableArray * Calendars;

@end