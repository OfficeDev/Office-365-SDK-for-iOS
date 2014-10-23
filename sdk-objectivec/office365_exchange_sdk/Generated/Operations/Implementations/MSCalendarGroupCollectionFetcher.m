/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSCalendarGroupCollectionFetcher.h"

/**
* The implementation file for type MSCalendarGroupCollectionFetcher.
*/

@implementation MSCalendarGroupCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSCalendarGroup class]];
}

-(NSURLSessionDataTask*)add:(MSCalendarGroup* )entity :(void (^)(MSCalendarGroup *calendarGroup, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSCalendarGroupFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSCalendarGroupFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSCalendarGroup class]];
}
@end
