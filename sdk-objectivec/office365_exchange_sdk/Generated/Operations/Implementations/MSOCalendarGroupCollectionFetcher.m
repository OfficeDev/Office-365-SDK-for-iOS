/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOCalendarGroupCollectionFetcher.h"

/**
* The implementation file for type MSOCalendarGroupCollectionFetcher.
*/

@implementation MSOCalendarGroupCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOCalendarGroup class]];
}

-(NSURLSessionDataTask*)add:(MSOCalendarGroup* )entity :(void (^)(MSOCalendarGroup *calendarGroup, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOCalendarGroupFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOCalendarGroupFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSOCalendarGroup class]];
}
@end
