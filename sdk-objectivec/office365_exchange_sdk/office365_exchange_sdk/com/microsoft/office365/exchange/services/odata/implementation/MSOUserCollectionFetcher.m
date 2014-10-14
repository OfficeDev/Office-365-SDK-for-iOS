/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOUserCollectionFetcher.h"

@implementation MSOUserCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOUser class]];
}

-(NSURLSessionDataTask *)execute:(void (^)(NSArray<MSOUser> *user, NSError *error))callback{
    return [super execute:^(id entity, NSError *error) {
        callback(entity, error);
    }];
}

-(NSURLSessionDataTask*)add:(MSOUser* )entity :(void (^)(MSOUser *user, NSError *e))callback{
	return nil;
}

-(MSOUserFetcher*)getById:(NSString *)Id{
	return nil;
}
@end
