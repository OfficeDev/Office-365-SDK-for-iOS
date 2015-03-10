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
@class MSGraphServiceCalendarCollectionFetcher;;
@class MSGraphServiceCalendarGroupOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceCalendarGroupFetcher.
*/


@protocol MSGraphServiceCalendarGroupFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSGraphServiceCalendarGroup* calendarGroup, MSODataException *error))callback;
-(NSURLSessionTask*) updateCalendarGroup:(id)entity withCallback:(void (^)(MSGraphServiceCalendarGroup*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteCalendarGroup:(void (^)(int status, MSODataException * error))callback;
-(id<MSGraphServiceCalendarGroupFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceCalendarGroupFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSGraphServiceCalendarGroupFetcher>)select : (NSString*) params;
-(id<MSGraphServiceCalendarGroupFetcher>)expand : (NSString*) value;

@required
-(MSGraphServiceCalendarGroupOperations*) getOperations;
-(MSGraphServiceCalendarCollectionFetcher*) getCalendars;

-(MSGraphServiceCalendarFetcher*) getCalendarsById : (NSString*)_id;
@end

@interface MSGraphServiceCalendarGroupFetcher : MSODataEntityFetcher<MSGraphServiceCalendarGroupFetcher>

@end