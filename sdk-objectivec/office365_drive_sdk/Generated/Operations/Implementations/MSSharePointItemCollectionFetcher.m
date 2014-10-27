/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSharePointItemCollectionFetcher.h"

/**
* The implementation file for type MSSharePointItemCollectionFetcher.
*/

@implementation MSSharePointItemCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSSharePointODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSSharePointItem class]];
}

-(NSURLSessionDataTask*)add:(MSSharePointItem* )entity :(void (^)(MSSharePointItem *item, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSSharePointItemFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSSharePointItemFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSSharePointItem class]];
}
@end
