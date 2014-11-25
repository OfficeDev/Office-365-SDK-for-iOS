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

#import <office365_odata_base/office365_odata_base.h>
#import "MSOOutlookCalendarOperations.h"
#import "MSOOutlookCalendar.h"
@class MSOOutlookEventCollectionFetcher;
@class MSOOutlookEventCollectionFetcher;


/**
* The header for type MSOOutlookCalendarFetcher.
*/

@protocol MSOOutlookCalendarFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOOutlookCalendar* calendar, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOOutlookCalendar*, NSError * error))callback;
@end

@interface MSOOutlookCalendarFetcher : MSODataEntityFetcher<MSOOutlookCalendarFetcher>

-(MSOOutlookCalendarOperations*) getOperations;

-(MSOOutlookEventCollectionFetcher*) getCalendarView;

-(MSOOutlookEventCollectionFetcher*) getEvents;

	
@end