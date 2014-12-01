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

@property MSOutlookImportance Importance;

-(void)setImportanceString:(NSString*)value;
@property bool HasAttachments;

@property NSDate *Start;

@property NSDate *End;

@property MSOutlookLocation *Location;

@property MSOutlookFreeBusyStatus ShowAs;

-(void)setShowAsString:(NSString*)value;
@property bool IsAllDay;

@property bool IsCancelled;

@property bool IsOrganizer;

@property bool ResponseRequested;

@property MSOutlookEventType Type;

-(void)setTypeString:(NSString*)value;
@property NSString *SeriesMasterId;

@property NSMutableArray<MSOutlookAttendee> *Attendees;

@property MSOutlookPatternedRecurrence *Recurrence;

@property MSOutlookRecipient *Organizer;


@end