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

#import "MSOutlookODataEntityFetcher.h"
#import "MSOutlookCalendarOperations.h"
#import "MSOutlookCalendar.h"
@class MSOutlookEventCollectionFetcher;
@class MSOutlookEventCollectionFetcher;

/**
* The header for type MSOutlookCalendarFetcher.
*/

@protocol MSOutlookCalendarFetcher

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSOutlookCalendar* calendar, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOutlookCalendar*, NSError * error))callback;
@end

@interface MSOutlookCalendarFetcher : MSOutlookODataEntityFetcher<MSOutlookCalendarFetcher>

-(MSOutlookCalendarOperations*) getOperations;
-(MSOutlookEventCollectionFetcher*) getCalendarView;
-(MSOutlookEventCollectionFetcher*) getEvents;
	
@end