/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSCalendar.h"
#import "MSODataCollectionFetcher.h"
#import "MSCalendarFetcher.h"

/**
* The header for type MSCalendarCollectionFetcher.
*/

@protocol MSCalendarCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSCalendar> *calendars, NSError *error))callback;

@end

@interface MSCalendarCollectionFetcher : MSODataCollectionFetcher<MSCalendarCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSCalendar* )entity :(void (^)(MSCalendar *calendar, NSError *e))callback;

-(MSCalendarFetcher*)getById:(NSString *)Id;

@end
