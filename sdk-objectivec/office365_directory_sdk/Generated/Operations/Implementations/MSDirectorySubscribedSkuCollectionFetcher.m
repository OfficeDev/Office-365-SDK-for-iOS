/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectorySubscribedSkuCollectionFetcher.h"

/**
* The implementation file for type MSDirectorySubscribedSkuCollectionFetcher.
*/

@implementation MSDirectorySubscribedSkuCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSDirectorySubscribedSku class]];
}

-(NSURLSessionDataTask*)add:(MSDirectorySubscribedSku* )entity :(void (^)(MSDirectorySubscribedSku *subscribedSku, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSDirectorySubscribedSkuFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSDirectorySubscribedSkuFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSDirectorySubscribedSku class]];
}
@end
