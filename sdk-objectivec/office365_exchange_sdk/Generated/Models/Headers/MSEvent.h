/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSImportance.h"
#import "MSFreeBusyStatus.h"
#import "MSEventType.h"
@class MSItemBody;
@class MSLocation;
@class MSAttendee;
@class MSPatternedRecurrence;
@class MSRecipient;
@class MSAttachment;
@class MSCalendar;
@class MSEvent;

#import <Foundation/Foundation.h>
#import "MSProtocols.h"
#import "MSItem.h"

/**
* The header for type Event.
*/

@interface MSEvent : MSItem
@property NSString *Subject;
@property MSItemBody *Body;
@property NSString *BodyPreview;
@property MSImportance *Importance;
@property bool HasAttachments;
@property NSDate *Start;
@property NSDate *End;
@property MSLocation *Location;
@property MSFreeBusyStatus *ShowAs;
@property bool IsAllDay;
@property bool IsCancelled;
@property bool IsOrganizer;
@property bool ResponseRequested;
@property MSEventType *Type;
@property NSString *SeriesMasterId;
@property NSMutableArray<MSAttendee> *Attendees;
@property MSPatternedRecurrence *Recurrence;
@property MSRecipient *Organizer;

@end