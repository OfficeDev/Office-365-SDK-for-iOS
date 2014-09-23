//  
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocols.h"

#import "Item.h"



@class Location;

@class FreeBusyStatus;

@class EventType;

@class Attendee;

@class PatternedRecurrence;

@class Calendar;

@interface Event : Item	


-(id<Event>)getOperations;

@property id<Event> Operations;

@property NSDate *Start;

@property NSDate *End;

@property Location *Location;

@property FreeBusyStatus *ShowAs;

@property bool IsAllDay;

@property bool IsCancelled;

@property bool IsOrganizer;

@property bool ResponseRequested;

@property EventType *Type;

@property NSString *SeriesId;

@property NSMutableArray<Attendee> *Attendees;

@property PatternedRecurrence *Recurrence;

@property Calendar *Calendar;


@end