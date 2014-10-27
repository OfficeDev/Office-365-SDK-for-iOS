/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookCalendarGroup.h"
#import "MSOutlookODataCollectionFetcher.h"
#import "MSOutlookCalendarGroupFetcher.h"

/**
* The header for type MSOutlookCalendarGroupCollectionFetcher.
*/

@protocol MSOutlookCalendarGroupCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOutlookCalendarGroup> *calendarGroups, NSError *error))callback;

@end

@interface MSOutlookCalendarGroupCollectionFetcher : MSOutlookODataCollectionFetcher<MSOutlookCalendarGroupCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSOutlookCalendarGroup* )entity :(void (^)(MSOutlookCalendarGroup *calendarGroup, NSError *e))callback;

-(MSOutlookCalendarGroupFetcher*)getById:(NSString *)Id;

@end
