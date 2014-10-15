/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataCollectionFetcher.h"
#import "MSOCalendarGroup.h"
#import "MSOCalendarGroupFetcher.h"

/**
* The header for type MSOCalendarGroupCollectionFetcher.
*/

@interface MSOCalendarGroupCollectionFetcher : MSOODataCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOCalendarGroup> *CalendarGroup, NSError *error))callback;

-(NSURLSessionDataTask*)add:(MSOCalendarGroup* )entity :(void (^)(MSOCalendarGroup *calendarGroup, NSError *e))callback;

-(MSOCalendarGroupFetcher*)getById:(NSString *)Id;
@end
