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
#import "MSOutlookEventOperations.h"
#import "MSOutlookEvent.h"
@class MSOutlookAttachmentCollectionFetcher;
@class MSOutlookCalendarFetcher;
@class MSOutlookEventCollectionFetcher;


/**
* The header for type MSOutlookEventFetcher.
*/

@protocol MSOutlookEventFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOutlookEvent* event, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOutlookEvent*, NSError * error))callback;
@end

@interface MSOutlookEventFetcher : MSODataEntityFetcher<MSOutlookEventFetcher>

-(MSOutlookEventOperations*) getOperations;

-(MSOutlookAttachmentCollectionFetcher*) getAttachments;

-(MSOutlookCalendarFetcher*) getCalendar;

-(MSOutlookEventCollectionFetcher*) getInstances;

	
@end