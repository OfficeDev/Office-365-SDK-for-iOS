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
#import "MSOutlookCalendarGroupOperations.h"
#import "MSOutlookCalendarGroup.h"
@class MSOutlookCalendarCollectionFetcher;
@class MSOutlookCalendarFetcher;

/**
* The header for type MSOutlookCalendarGroupFetcher.
*/

@protocol MSOutlookCalendarGroupFetcher

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSOutlookCalendarGroup* calendarGroup, MSODataException *error))callback;
-(NSURLSessionDataTask*) updateCalendarGroup:(id)entity withCallback:(void (^)(MSOutlookCalendarGroup*, MSODataException * error))callback;
-(NSURLSessionDataTask*) deleteCalendarGroup:(void (^)(int status, MSODataException * error))callback;
-(id<MSOutlookCalendarGroupFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSOutlookCalendarGroupFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSOutlookCalendarGroupFetcher>)select : (NSString*) params;
-(id<MSOutlookCalendarGroupFetcher>)expand : (NSString*) value;
@end

@interface MSOutlookCalendarGroupFetcher : MSODataEntityFetcher<MSOutlookCalendarGroupFetcher>

-(MSOutlookCalendarGroupOperations*) getOperations;

-(MSOutlookCalendarCollectionFetcher*) getCalendars;

-(MSOutlookCalendarFetcher*) getCalendarsById : (NSString*)_id;

	
@end