/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSTenantDetailCollectionFetcher.h"

/**
* The implementation file for type MSTenantDetailCollectionFetcher.
*/

@implementation MSTenantDetailCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSTenantDetail class]];
}

-(NSURLSessionDataTask*)add:(MSTenantDetail* )entity :(void (^)(MSTenantDetail *tenantDetail, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSTenantDetailFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSTenantDetailFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSTenantDetail class]];
}
@end
