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

@protocol MSOCalendarGroupCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOCalendarGroup> *calendarGroups, NSError *error))callback;

@end

@interface MSOCalendarGroupCollectionFetcher : MSOODataCollectionFetcher<MSOCalendarGroupCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSOCalendarGroup* )entity :(void (^)(MSOCalendarGroup *calendarGroup, NSError *e))callback;

-(MSOCalendarGroupFetcher*)getById:(NSString *)Id;

@end
