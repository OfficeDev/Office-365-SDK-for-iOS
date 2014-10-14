/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSOItemBody;
#import "MSOImportance.h"
@class MSOLocation;
#import "MSOFreeBusyStatus.h"
#import "MSOEventType.h"
@class MSOAttendee;
@class MSOPatternedRecurrence;
@class MSORecipient;
@class MSOAttachment;
@class MSOCalendar;

#import <Foundation/Foundation.h>
#import "MSOProtocols.h"
#import "MSOItem.h"

@interface MSOEvent : MSOItem
@property NSString *Subject;
@property MSOItemBody *Body;
@property NSString *BodyPreview;
@property MSOImportance *Importance;
@property bool HasAttachments;
@property NSDate *Start;
@property NSDate *End;
@property MSOLocation *Location;
@property MSOFreeBusyStatus *ShowAs;
@property bool IsAllDay;
@property bool IsCancelled;
@property bool IsOrganizer;
@property bool ResponseRequested;
@property MSOEventType *Type;
@property NSString *SeriesMasterId;
@property NSMutableArray<MSOAttendee> *Attendees;
@property MSOPatternedRecurrence *Recurrence;
@property MSORecipient *Organizer;

@end