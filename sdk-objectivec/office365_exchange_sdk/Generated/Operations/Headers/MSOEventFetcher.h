/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import "MSOODataEntityFetcher.h"
#import "MSOEventOperations.h"
#import "MSOEvent.h"

@class MSOAttachmentCollectionFetcher;
@class MSOCalendarFetcher;


/**
* The header for type MSOEventFetcher.
*/


@protocol MSOEventFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOEvent* event, NSError *error))callback;

@end

@interface MSOEventFetcher : MSOODataEntityFetcher<MSOEventFetcher>

-(MSOEventOperations*) getOperations;

-(MSOAttachmentCollectionFetcher*) getAttachments;
-(MSOCalendarFetcher*) getCalendar;
@end