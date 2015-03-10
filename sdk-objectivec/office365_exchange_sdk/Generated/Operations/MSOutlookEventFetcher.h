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

@class MSOutlookAttachmentFetcher;;
@class MSOutlookAttachmentCollectionFetcher;;
@class MSOutlookCalendarFetcher;;
@class MSOutlookEventFetcher;;
@class MSOutlookEventCollectionFetcher;;
@class MSOutlookEventOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSOutlookModels.h"

/**
* The header for type MSOutlookEventFetcher.
*/


@protocol MSOutlookEventFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSOutlookEvent* event, MSODataException *error))callback;
-(NSURLSessionTask*) updateEvent:(id)entity withCallback:(void (^)(MSOutlookEvent*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteEvent:(void (^)(int status, MSODataException * error))callback;
-(id<MSOutlookEventFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSOutlookEventFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSOutlookEventFetcher>)select : (NSString*) params;
-(id<MSOutlookEventFetcher>)expand : (NSString*) value;

@required
-(MSOutlookEventOperations*) getOperations;
-(MSOutlookAttachmentCollectionFetcher*) getAttachments;

-(MSOutlookAttachmentFetcher*) getAttachmentsById : (NSString*)_id;
-(MSOutlookCalendarFetcher*) getCalendar;
-(MSOutlookEventCollectionFetcher*) getInstances;

-(MSOutlookEventFetcher*) getInstancesById : (NSString*)_id;
@end

@interface MSOutlookEventFetcher : MSODataEntityFetcher<MSOutlookEventFetcher>

@end