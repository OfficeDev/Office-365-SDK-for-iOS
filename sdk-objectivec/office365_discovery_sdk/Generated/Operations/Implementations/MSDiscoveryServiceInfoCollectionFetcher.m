/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDiscoveryServiceInfoCollectionFetcher.h"

/**
* The implementation file for type MSDiscoveryServiceInfoCollectionFetcher.
*/

@implementation MSDiscoveryServiceInfoCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSDiscoveryODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSDiscoveryServiceInfo class]];
}

-(NSURLSessionDataTask*)add:(MSDiscoveryServiceInfo* )entity :(void (^)(MSDiscoveryServiceInfo *serviceInfo, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSDiscoveryServiceInfoFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSDiscoveryServiceInfoFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSDiscoveryServiceInfo class]];
}
@end
