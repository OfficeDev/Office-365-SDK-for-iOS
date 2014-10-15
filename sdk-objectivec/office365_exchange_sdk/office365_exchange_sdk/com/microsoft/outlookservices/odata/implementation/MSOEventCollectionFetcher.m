/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOEventCollectionFetcher.h"

/**
* The implementation file for type MSOEventCollectionFetcher.
*/

@implementation MSOEventCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOEvent class]];
}

-(NSURLSessionDataTask *)execute:(void (^)(NSArray<MSOEvent> *event, NSError *error))callback{
    return [super execute:^(id entity, NSError *error) {
        callback(entity, error);
    }];
}

-(NSURLSessionDataTask*)add:(MSOEvent* )entity :(void (^)(MSOEvent *event, NSError *e))callback{
	return nil;
}

-(MSOEventFetcher*)getById:(NSString *)Id{
	return nil;
}
@end
