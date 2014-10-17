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

-(NSURLSessionDataTask*)add:(MSOUser* )entity :(void (^)(MSOUser *user, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOUserFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOUserFetcher alloc] initWith:@"" : self :[MSOUser class]];
}
@end
