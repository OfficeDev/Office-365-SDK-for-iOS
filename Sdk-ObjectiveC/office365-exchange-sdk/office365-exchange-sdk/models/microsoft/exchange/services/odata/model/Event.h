//
//  Event.h
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"
#import "Location.h"
#import "FreeBusyStatus.h"
#import "EventType.h"
#import "PatternedRecurrence.h"
#import "Calendar.h"

@interface Event : Item

@property NSDate * Start;
@property NSDate * End;
@property Location * Location;
@property enum FreeBusyStatus * ShowAs;
@property bool IsAllDay;
@property bool IsCancelled;
@property bool IsOrganizer;
@property bool ResponseRequested;
@property enum EventType * Type;
@property NSString * SeriesId;
@property NSMutableArray * Attendees;
@property PatternedRecurrence * Recurrence;
@property Calendar * Calendar;

@end