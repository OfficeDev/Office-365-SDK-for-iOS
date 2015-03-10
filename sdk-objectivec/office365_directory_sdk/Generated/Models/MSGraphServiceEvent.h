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

@class MSGraphServiceItemBody;
@class MSGraphServiceLocation;
@class MSGraphServiceAttendees;
@class MSGraphServicePatternedRecurrence;
@class MSGraphServiceRecipient;
@class MSGraphServiceCalendar;
@class MSGraphServiceEvent;


#import "MSGraphServiceProtocols.h"

#import <Foundation/Foundation.h>


/**
* The header for type Event.
*/

@interface MSGraphServiceEvent : NSObject

@property NSString *$$__ODataType;
@property NSString *Id;
@property MSGraphServiceItemBody *Body;
@property NSString *BodyPreview;
@property NSString *Importance;
@property NSString *Subject;
@property BOOL HasAttachments;
@property MSGraphServiceLocation *Location;
@property NSString *ShowAs;
@property NSDate *Start;
@property NSDate *End;
@property BOOL IsAllDay;
@property BOOL IsCancelled;
@property BOOL IsOrganizer;
@property BOOL ResponseRequested;
@property NSString *Type;
@property NSString *SeriesMasterId;
@property NSMutableArray<MSGraphServiceAttendees> *Attendees;
@property MSGraphServicePatternedRecurrence *Recurrence;
@property MSGraphServiceRecipient *Organizer;
@property MSGraphServiceCalendar *Calendar;
@property NSMutableArray<MSGraphServiceEvent> *Instances;

@end