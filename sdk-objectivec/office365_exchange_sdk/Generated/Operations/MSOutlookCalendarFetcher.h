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

@class MSOutlookEventFetcher;;
@class MSOutlookEventCollectionFetcher;;
@class MSOutlookCalendarOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSOutlookModels.h"

/**
* The header for type MSOutlookCalendarFetcher.
*/


@protocol MSOutlookCalendarFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSOutlookCalendar* calendar, MSODataException *error))callback;
-(NSURLSessionTask*) updateCalendar:(id)entity withCallback:(void (^)(MSOutlookCalendar*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteCalendar:(void (^)(int status, MSODataException * error))callback;
-(id<MSOutlookCalendarFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSOutlookCalendarFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSOutlookCalendarFetcher>)select : (NSString*) params;
-(id<MSOutlookCalendarFetcher>)expand : (NSString*) value;

@required
-(MSOutlookCalendarOperations*) getOperations;
-(MSOutlookEventCollectionFetcher*) getCalendarView;

-(MSOutlookEventFetcher*) getCalendarViewById : (NSString*)_id;
-(MSOutlookEventCollectionFetcher*) getEvents;

-(MSOutlookEventFetcher*) getEventsById : (NSString*)_id;
@end

@interface MSOutlookCalendarFetcher : MSODataEntityFetcher<MSOutlookCalendarFetcher>

@end