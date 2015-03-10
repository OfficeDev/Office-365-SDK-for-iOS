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

@class MSGraphServiceCalendarFetcher;;
@class MSGraphServiceEventFetcher;;
@class MSGraphServiceEventCollectionFetcher;;
@class MSGraphServiceCalendarViewFetcher;;
@class MSGraphServiceEventOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceEventFetcher.
*/


@protocol MSGraphServiceEventFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSGraphServiceEvent* event, MSODataException *error))callback;
-(NSURLSessionTask*) updateEvent:(id)entity withCallback:(void (^)(MSGraphServiceEvent*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteEvent:(void (^)(int status, MSODataException * error))callback;
-(id<MSGraphServiceEventFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceEventFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSGraphServiceEventFetcher>)select : (NSString*) params;
-(id<MSGraphServiceEventFetcher>)expand : (NSString*) value;

@required
-(MSGraphServiceEventOperations*) getOperations;
-(MSGraphServiceCalendarFetcher*) getCalendar;
-(MSGraphServiceEventCollectionFetcher*) getInstances;

-(MSGraphServiceEventFetcher*) getInstancesById : (NSString*)_id;
	
-(MSGraphServiceCalendarViewFetcher*) asCalendarView;	
@end

@interface MSGraphServiceEventFetcher : MSODataEntityFetcher<MSGraphServiceEventFetcher>

@end