/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookODataEntityFetcher.h"
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

@interface MSOutlookEventFetcher : MSOutlookODataEntityFetcher<MSOutlookEventFetcher>

-(MSOutlookEventOperations*) getOperations;
-(MSOutlookAttachmentCollectionFetcher*) getAttachments;
-(MSOutlookCalendarFetcher*) getCalendar;
-(MSOutlookEventCollectionFetcher*) getInstances;
	
@end