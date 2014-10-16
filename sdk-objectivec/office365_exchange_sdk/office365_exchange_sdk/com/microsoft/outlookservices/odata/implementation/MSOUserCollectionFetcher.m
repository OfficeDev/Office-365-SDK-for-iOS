/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOUserCollectionFetcher.h"

/**
* The implementation file for type MSOUserCollectionFetcher.
*/

@implementation MSOUserCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOUser class]];
}

-(NSURLSessionDataTask *)execute:(void (^)(NSArray<MSOUser> *user, NSError *error))callback{
    return [super execute:^(id entity, NSError *error) {
        callback(entity, error);
    }];
}

-(MSOUserFetcher*)getById:(NSString *)Id{
    [super getById:Id];
    return [[MSOUserFetcher alloc] initWith:@"" : self :[MSOUser class]];
}

-(NSURLSessionDataTask *)add:(MSOUser* )entity :(void (^)(MSOUser*, NSError *e))callback{
    return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

@end