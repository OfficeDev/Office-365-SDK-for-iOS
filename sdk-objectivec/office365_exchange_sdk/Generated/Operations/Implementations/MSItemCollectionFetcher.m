/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSItemCollectionFetcher.h"

/**
* The implementation file for type MSItemCollectionFetcher.
*/

@implementation MSItemCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSItem class]];
}

-(NSURLSessionDataTask*)add:(MSItem* )entity :(void (^)(MSItem *item, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSItemFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSItemFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSItem class]];
}
@end
