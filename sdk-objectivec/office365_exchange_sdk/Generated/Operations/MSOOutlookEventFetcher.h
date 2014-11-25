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
#import "MSOOutlookEventOperations.h"
#import "MSOOutlookEvent.h"
@class MSOOutlookAttachmentCollectionFetcher;
@class MSOOutlookCalendarFetcher;
@class MSOOutlookEventCollectionFetcher;


/**
* The header for type MSOOutlookEventFetcher.
*/

@protocol MSOOutlookEventFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOOutlookEvent* event, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOOutlookEvent*, NSError * error))callback;
@end

@interface MSOOutlookEventFetcher : MSODataEntityFetcher<MSOOutlookEventFetcher>

-(MSOOutlookEventOperations*) getOperations;

-(MSOOutlookAttachmentCollectionFetcher*) getAttachments;

-(MSOOutlookCalendarFetcher*) getCalendar;

-(MSOOutlookEventCollectionFetcher*) getInstances;

	
@end