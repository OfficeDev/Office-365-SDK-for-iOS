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

@class MSGraphServiceCalendarViewOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceCalendarViewFetcher.
*/


@protocol MSGraphServiceCalendarViewFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSGraphServiceCalendarView* calendarView, MSODataException *error))callback;
-(NSURLSessionTask*) updateCalendarView:(id)entity withCallback:(void (^)(MSGraphServiceCalendarView*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteCalendarView:(void (^)(int status, MSODataException * error))callback;
-(id<MSGraphServiceCalendarViewFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceCalendarViewFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSGraphServiceCalendarViewFetcher>)select : (NSString*) params;
-(id<MSGraphServiceCalendarViewFetcher>)expand : (NSString*) value;

@required
-(MSGraphServiceCalendarViewOperations*) getOperations;
@end

@interface MSGraphServiceCalendarViewFetcher : MSODataEntityFetcher<MSGraphServiceCalendarViewFetcher>

@end