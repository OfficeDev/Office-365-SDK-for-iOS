/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryTenantDetailCollectionFetcher.h"

/**
* The implementation file for type MSDirectoryTenantDetailCollectionFetcher.
*/

@implementation MSDirectoryTenantDetailCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSDirectoryTenantDetail class]];
}

-(NSURLSessionDataTask*)add:(MSDirectoryTenantDetail* )entity :(void (^)(MSDirectoryTenantDetail *tenantDetail, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSDirectoryTenantDetailFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSDirectoryTenantDetailFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSDirectoryTenantDetail class]];
}
@end
