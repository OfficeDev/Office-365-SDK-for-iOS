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
#import "MSOOutlookCalendar.h"
#import "MSOOutlookCalendarFetcher.h"

/**
* The header for type MSOOutlookCalendarCollectionFetcher.
*/

@protocol MSOOutlookCalendarCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOOutlookCalendar> *calendars, NSError *error))callback;

@end

@interface MSOOutlookCalendarCollectionFetcher : MSODataCollectionFetcher<MSOOutlookCalendarCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSOOutlookCalendar* )entity withCallback:(void (^)(MSOOutlookCalendar *calendar, NSError *e))callback;

-(MSOOutlookCalendarFetcher*)getById:(NSString *)Id;

@end