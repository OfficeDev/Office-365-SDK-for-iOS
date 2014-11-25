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
#import "MSOOutlookCalendarGroup.h"
#import "MSOOutlookCalendarGroupFetcher.h"

/**
* The header for type MSOOutlookCalendarGroupCollectionFetcher.
*/

@protocol MSOOutlookCalendarGroupCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOOutlookCalendarGroup> *calendarGroups, NSError *error))callback;

@end

@interface MSOOutlookCalendarGroupCollectionFetcher : MSODataCollectionFetcher<MSOOutlookCalendarGroupCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSOOutlookCalendarGroup* )entity withCallback:(void (^)(MSOOutlookCalendarGroup *calendarGroup, NSError *e))callback;

-(MSOOutlookCalendarGroupFetcher*)getById:(NSString *)Id;

@end