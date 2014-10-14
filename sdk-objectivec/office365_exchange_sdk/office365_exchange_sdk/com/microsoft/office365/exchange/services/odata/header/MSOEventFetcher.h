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

@interface MSOEventFetcher : MSOODataEntityFetcher

-(MSOEventOperations*) getOperations;
-(NSURLSessionDataTask *)execute:(void (^)(MSOEvent* event, NSError *error))callback;

-(MSOAttachmentCollectionFetcher*) getAttachments;
-(MSOCalendarFetcher*) getCalendar;
@end