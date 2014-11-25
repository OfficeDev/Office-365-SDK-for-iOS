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
#import "MSOOutlookCalendarGroupOperations.h"
#import "MSOOutlookCalendarGroup.h"
@class MSOOutlookCalendarCollectionFetcher;


/**
* The header for type MSOOutlookCalendarGroupFetcher.
*/

@protocol MSOOutlookCalendarGroupFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOOutlookCalendarGroup* calendarGroup, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOOutlookCalendarGroup*, NSError * error))callback;
@end

@interface MSOOutlookCalendarGroupFetcher : MSODataEntityFetcher<MSOOutlookCalendarGroupFetcher>

-(MSOOutlookCalendarGroupOperations*) getOperations;

-(MSOOutlookCalendarCollectionFetcher*) getCalendars;

	
@end