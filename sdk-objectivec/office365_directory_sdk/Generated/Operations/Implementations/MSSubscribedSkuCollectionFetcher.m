/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSubscribedSkuCollectionFetcher.h"

/**
* The implementation file for type MSSubscribedSkuCollectionFetcher.
*/

@implementation MSSubscribedSkuCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSSubscribedSku class]];
}

-(NSURLSessionDataTask*)add:(MSSubscribedSku* )entity :(void (^)(MSSubscribedSku *subscribedSku, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSSubscribedSkuFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSSubscribedSkuFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSSubscribedSku class]];
}
@end
