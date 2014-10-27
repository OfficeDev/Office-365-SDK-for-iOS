/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookImportance.h"
#import "MSOutlookFreeBusyStatus.h"
#import "MSOutlookEventType.h"
@class MSOutlookItemBody;
@class MSOutlookLocation;
@class MSOutlookAttendee;
@class MSOutlookPatternedRecurrence;
@class MSOutlookRecipient;
@class MSOutlookAttachment;
@class MSOutlookCalendar;
@class MSOutlookEvent;

#import <Foundation/Foundation.h>
#import "MSOutlookProtocols.h"
#import "MSOutlookItem.h"

/**
* The header for type Event.
*/

@interface MSOutlookEvent : MSOutlookItem
@property NSString *Subject;
@property MSOutlookItemBody *Body;
@property NSString *BodyPreview;
@property MSOutlookImportance *Importance;
@property bool HasAttachments;
@property NSDate *Start;
@property NSDate *End;
@property MSOutlookLocation *Location;
@property MSOutlookFreeBusyStatus *ShowAs;
@property bool IsAllDay;
@property bool IsCancelled;
@property bool IsOrganizer;
@property bool ResponseRequested;
@property MSOutlookEventType *Type;
@property NSString *SeriesMasterId;
@property NSMutableArray<MSOutlookAttendee> *Attendees;
@property MSOutlookPatternedRecurrence *Recurrence;
@property MSOutlookRecipient *Organizer;

@end