/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSCalendarGroup.h"
#import "MSODataCollectionFetcher.h"
#import "MSCalendarGroupFetcher.h"

/**
* The header for type MSCalendarGroupCollectionFetcher.
*/

@protocol MSCalendarGroupCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSCalendarGroup> *calendarGroups, NSError *error))callback;

@end

@interface MSCalendarGroupCollectionFetcher : MSODataCollectionFetcher<MSCalendarGroupCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSCalendarGroup* )entity :(void (^)(MSCalendarGroup *calendarGroup, NSError *e))callback;

-(MSCalendarGroupFetcher*)getById:(NSString *)Id;

@end
