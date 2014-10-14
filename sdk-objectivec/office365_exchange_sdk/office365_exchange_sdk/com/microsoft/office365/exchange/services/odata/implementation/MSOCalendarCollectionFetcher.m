/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOCalendarCollectionFetcher.h"

@implementation MSOCalendarCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOCalendar class]];
}

-(NSURLSessionDataTask *)execute:(void (^)(NSArray<MSOCalendar> *calendar, NSError *error))callback{
    return [super execute:^(id entity, NSError *error) {
        callback(entity, error);
    }];
}

-(NSURLSessionDataTask*)add:(MSOCalendar* )entity :(void (^)(MSOCalendar *calendar, NSError *e))callback{
	return nil;
}

-(MSOCalendarFetcher*)getById:(NSString *)Id{
	return nil;
}
@end
