/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookCalendarCollectionFetcher.h"

/**
* The implementation file for type MSOutlookCalendarCollectionFetcher.
*/

@implementation MSOutlookCalendarCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOutlookCalendar class]];
}

-(NSURLSessionDataTask*)add:(MSOutlookCalendar* )entity :(void (^)(MSOutlookCalendar *calendar, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOutlookCalendarFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOutlookCalendarFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSOutlookCalendar class]];
}
@end
