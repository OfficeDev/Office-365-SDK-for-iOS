/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryUserCollectionFetcher.h"

/**
* The implementation file for type MSDirectoryUserCollectionFetcher.
*/

@implementation MSDirectoryUserCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSDirectoryUser class]];
}

-(NSURLSessionDataTask*)add:(MSDirectoryUser* )entity :(void (^)(MSDirectoryUser *user, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSDirectoryUserFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSDirectoryUserFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSDirectoryUser class]];
}
@end
