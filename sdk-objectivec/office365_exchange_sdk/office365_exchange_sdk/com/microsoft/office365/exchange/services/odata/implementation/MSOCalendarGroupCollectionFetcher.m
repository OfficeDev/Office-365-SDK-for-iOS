/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOCalendarGroupCollectionFetcher.h"

@implementation MSOCalendarGroupCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOCalendarGroup class]];
}

-(NSURLSessionDataTask *)execute:(void (^)(NSArray<MSOCalendarGroup> *calendarGroup, NSError *error))callback{
    return [super execute:^(id entity, NSError *error) {
        callback(entity, error);
    }];
}

-(NSURLSessionDataTask*)add:(MSOCalendarGroup* )entity :(void (^)(MSOCalendarGroup *calendarGroup, NSError *e))callback{
	return nil;
}

-(MSOCalendarGroupFetcher*)getById:(NSString *)Id{
	return nil;
}
@end
