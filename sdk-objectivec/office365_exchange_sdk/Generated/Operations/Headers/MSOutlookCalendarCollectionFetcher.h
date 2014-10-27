/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookCalendar.h"
#import "MSOutlookODataCollectionFetcher.h"
#import "MSOutlookCalendarFetcher.h"

/**
* The header for type MSOutlookCalendarCollectionFetcher.
*/

@protocol MSOutlookCalendarCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOutlookCalendar> *calendars, NSError *error))callback;

@end

@interface MSOutlookCalendarCollectionFetcher : MSOutlookODataCollectionFetcher<MSOutlookCalendarCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSOutlookCalendar* )entity :(void (^)(MSOutlookCalendar *calendar, NSError *e))callback;

-(MSOutlookCalendarFetcher*)getById:(NSString *)Id;

@end
