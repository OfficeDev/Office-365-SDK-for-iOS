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
@class MSOutlookAttachmentFetcher;

/**
* The header for type MSOutlookEventFetcher.
*/

@protocol MSOutlookEventFetcher

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSOutlookEvent* event, MSODataException *error))callback;
-(NSURLSessionDataTask*) updateEvent:(id)entity withCallback:(void (^)(MSOutlookEvent*, MSODataException * error))callback;
-(NSURLSessionDataTask*) deleteEvent:(void (^)(int status, MSODataException * error))callback;
-(id<MSOutlookEventFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSOutlookEventFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSOutlookEventFetcher>)select : (NSString*) params;
-(id<MSOutlookEventFetcher>)expand : (NSString*) value;
@end

@interface MSOutlookEventFetcher : MSODataEntityFetcher<MSOutlookEventFetcher>

-(MSOutlookEventOperations*) getOperations;

-(MSOutlookAttachmentCollectionFetcher*) getAttachments;

-(MSOutlookAttachmentFetcher*) getAttachmentsById : (NSString*)_id;

-(MSOutlookCalendarFetcher*) getCalendar;

-(MSOutlookEventCollectionFetcher*) getInstances;

-(MSOutlookEventFetcher*) getInstancesById : (NSString*)_id;

	
@end