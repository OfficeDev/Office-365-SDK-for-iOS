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
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOutlookCalendarGroup> *calendarGroups, NSError *error))callback;

@end

@interface MSOutlookCalendarGroupCollectionFetcher : MSODataCollectionFetcher<MSOutlookCalendarGroupCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSOutlookCalendarGroup* )entity withCallback:(void (^)(MSOutlookCalendarGroup *calendarGroup, NSError *e))callback;

-(MSOutlookCalendarGroupFetcher*)getById:(NSString *)Id;

@end