/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookCalendarGroupCollectionFetcher.h"

/**
* The implementation file for type MSOutlookCalendarGroupCollectionFetcher.
*/

@implementation MSOutlookCalendarGroupCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOutlookCalendarGroup class]];
}

-(NSURLSessionDataTask*)add:(MSOutlookCalendarGroup* )entity :(void (^)(MSOutlookCalendarGroup *calendarGroup, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOutlookCalendarGroupFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOutlookCalendarGroupFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSOutlookCalendarGroup class]];
}
@end
