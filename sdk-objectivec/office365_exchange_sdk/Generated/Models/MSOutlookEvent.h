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

@class MSOutlookItemBody;
@class MSOutlookLocation;
@class MSOutlookAttendee;
@class MSOutlookPatternedRecurrence;
@class MSOutlookRecipient;
@class MSOutlookAttachment;
@class MSOutlookCalendar;
@class MSOutlookEvent;

#import "MSOutlookImportance.h"
#import "MSOutlookFreeBusyStatus.h"
#import "MSOutlookEventType.h"

#import "MSOutlookProtocols.h"
#import "MSOutlookItem.h"
#import <Foundation/Foundation.h>


/**
* The header for type Event.
*/

@interface MSOutlookEvent : MSOutlookItem

@property NSString *Subject;
@property MSOutlookItemBody *Body;
@property NSString *BodyPreview;
@property MSOutlookImportance Importance;
-(void)setImportanceString:(NSString*)value;
@property BOOL HasAttachments;
@property NSDate *Start;
@property NSDate *End;
@property MSOutlookLocation *Location;
@property MSOutlookFreeBusyStatus ShowAs;
-(void)setShowAsString:(NSString*)value;
@property BOOL IsAllDay;
@property BOOL IsCancelled;
@property BOOL IsOrganizer;
@property BOOL ResponseRequested;
@property MSOutlookEventType Type;
-(void)setTypeString:(NSString*)value;
@property NSString *SeriesMasterId;
@property NSMutableArray<MSOutlookAttendee> *Attendees;
@property MSOutlookPatternedRecurrence *Recurrence;
@property MSOutlookRecipient *Organizer;
@property NSMutableArray<MSOutlookAttachment> *Attachments;
@property MSOutlookCalendar *Calendar;
@property NSMutableArray<MSOutlookEvent> *Instances;

@end