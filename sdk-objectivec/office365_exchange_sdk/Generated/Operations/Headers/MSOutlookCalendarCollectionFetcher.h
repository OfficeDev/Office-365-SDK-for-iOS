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

#import "MSOutlookCalendar.h"
#import "MSOutlookODataCollectionFetcher.h"
#import "MSOutlookCalendarFetcher.h"

/**
* The header for type MSOutlookCalendarCollectionFetcher.
*/

@protocol MSOutlookCalendarCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOutlookCalendar> *calendars, NSError *error))callback;

@end

@interface MSOutlookCalendarCollectionFetcher : MSOutlookODataCollectionFetcher<MSOutlookCalendarCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataReadable>)parent;

-(NSURLSessionDataTask*)add:(MSOutlookCalendar* )entity :(void (^)(MSOutlookCalendar *calendar, NSError *e))callback;

-(MSOutlookCalendarFetcher*)getById:(NSString *)Id;

@end
