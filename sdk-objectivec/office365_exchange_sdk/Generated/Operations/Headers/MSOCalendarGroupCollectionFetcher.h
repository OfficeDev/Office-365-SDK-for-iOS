/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOCalendarGroup.h"
#import "MSOODataCollectionFetcher.h"
#import "MSOCalendarGroupFetcher.h"

/**
* The header for type MSOCalendarGroupCollectionFetcher.
*/

@interface MSOCalendarGroupCollectionFetcher : MSOODataCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSOCalendarGroup* )entity :(void (^)(MSOCalendarGroup *calendarGroup, NSError *e))callback;

-(MSOCalendarGroupFetcher*)getById:(NSString *)Id;
@end
