/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSCalendarCollectionFetcher.h"

/**
* The implementation file for type MSCalendarCollectionFetcher.
*/

@implementation MSCalendarCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSCalendar class]];
}

-(NSURLSessionDataTask*)add:(MSCalendar* )entity :(void (^)(MSCalendar *calendar, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSCalendarFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSCalendarFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSCalendar class]];
}
@end
