/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"
#import "MSEventOperations.h"
#import "MSEvent.h"
@class MSAttachmentCollectionFetcher;
@class MSCalendarFetcher;
@class MSEventCollectionFetcher;

/**
* The header for type MSEventFetcher.
*/

@protocol MSEventFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSEvent* event, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSEvent*, NSError * error))callback;
@end

@interface MSEventFetcher : MSODataEntityFetcher<MSEventFetcher>

-(MSEventOperations*) getOperations;
-(MSAttachmentCollectionFetcher*) getAttachments;
-(MSCalendarFetcher*) getCalendar;
-(MSEventCollectionFetcher*) getInstances;
	
@end