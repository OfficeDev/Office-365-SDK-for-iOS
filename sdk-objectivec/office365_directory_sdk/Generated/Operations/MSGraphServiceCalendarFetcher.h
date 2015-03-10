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

@class MSGraphServiceEventFetcher;;
@class MSGraphServiceEventCollectionFetcher;;
@class MSGraphServiceCalendarOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceCalendarFetcher.
*/


@protocol MSGraphServiceCalendarFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSGraphServiceCalendar* calendar, MSODataException *error))callback;
-(NSURLSessionTask*) updateCalendar:(id)entity withCallback:(void (^)(MSGraphServiceCalendar*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteCalendar:(void (^)(int status, MSODataException * error))callback;
-(id<MSGraphServiceCalendarFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceCalendarFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSGraphServiceCalendarFetcher>)select : (NSString*) params;
-(id<MSGraphServiceCalendarFetcher>)expand : (NSString*) value;

@required
-(MSGraphServiceCalendarOperations*) getOperations;
-(MSGraphServiceEventCollectionFetcher*) getCalendarView;

-(MSGraphServiceEventFetcher*) getCalendarViewById : (NSString*)_id;
-(MSGraphServiceEventCollectionFetcher*) getEvents;

-(MSGraphServiceEventFetcher*) getEventsById : (NSString*)_id;
@end

@interface MSGraphServiceCalendarFetcher : MSODataEntityFetcher<MSGraphServiceCalendarFetcher>

@end