/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 *
 * Warning: This code was generated automatically. Edits will be overwritten.
 * To make changes to this code, please make changes to the generation framework itself:
 * https://github.com/MSOpenTech/odata-codegen
 *******************************************************************************/

#import "MSOOutlookImportance.h"
#import "MSOOutlookFreeBusyStatus.h"
#import "MSOOutlookEventType.h"
@class MSOOutlookItemBody;
@class MSOOutlookLocation;
@class MSOOutlookAttendee;
@class MSOOutlookPatternedRecurrence;
@class MSOOutlookRecipient;
@class MSOOutlookAttachment;
@class MSOOutlookCalendar;
@class MSOOutlookEvent;

#import <Foundation/Foundation.h>
#import "MSOOutlookProtocols.h"
#import "MSOOutlookItem.h"

/**
* The header for type Event.
*/

@interface MSOOutlookEvent : MSOOutlookItem


@property NSString *Subject;

@property MSOOutlookItemBody *Body;

@property NSString *BodyPreview;

@property MSOOutlookImportance *Importance;

@property bool HasAttachments;

@property NSDate *Start;

@property NSDate *End;

@property MSOOutlookLocation *Location;

@property MSOOutlookFreeBusyStatus *ShowAs;

@property bool IsAllDay;

@property bool IsCancelled;

@property bool IsOrganizer;

@property bool ResponseRequested;

@property MSOOutlookEventType *Type;

@property NSString *SeriesMasterId;

@property NSMutableArray<MSOOutlookAttendee> *Attendees;

@property MSOOutlookPatternedRecurrence *Recurrence;

@property MSOOutlookRecipient *Organizer;


@end