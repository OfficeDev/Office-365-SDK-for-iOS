/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOCalendar.h"
#import "MSOCalendarFetcher.h"

/**
* The header for type MSOCalendarCollectionFetcher.
*/

@interface MSOCalendarCollectionFetcher : MSOODataCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOCalendar> *Calendar, NSError *error))callback;

-(NSURLSessionDataTask*)add:(MSOCalendar* )entity :(void (^)(MSOCalendar *calendar, NSError *e))callback;

-(MSOCalendarFetcher*)getById:(NSString *)Id;
@end
