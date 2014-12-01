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
#import "MSOutlookCalendarGroup.h"
#import "MSOutlookCalendarGroupFetcher.h"

/**
* The header for type MSOutlookCalendarGroupCollectionFetcher.
*/

@protocol MSOutlookCalendarGroupCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOutlookCalendarGroup> *calendarGroups, MSODataException *error))callback;

-(id<MSOutlookCalendarGroupCollectionFetcher>)select : (NSString*) params;
-(id<MSOutlookCalendarGroupCollectionFetcher>)filter : (NSString*) params;
-(id<MSOutlookCalendarGroupCollectionFetcher>)top : (int) value;
-(id<MSOutlookCalendarGroupCollectionFetcher>)skip : (int) value;
-(id<MSOutlookCalendarGroupCollectionFetcher>)expand : (NSString*) value;
-(id<MSOutlookCalendarGroupCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSOutlookCalendarGroupCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSOutlookCalendarGroupCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
@end

@interface MSOutlookCalendarGroupCollectionFetcher : MSODataCollectionFetcher<MSOutlookCalendarGroupCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSOutlookCalendarGroupFetcher*)getById:(NSString *)Id;
-(NSURLSessionDataTask*)addCalendarGroup:(MSOutlookCalendarGroup* )entity withCallback:(void (^)(MSOutlookCalendarGroup *calendarGroup, MSODataException *e))callback;

@end