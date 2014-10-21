/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOItemCollectionFetcher.h"

/**
* The implementation file for type MSOItemCollectionFetcher.
*/

@implementation MSOItemCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOItem class]];
}

-(NSURLSessionDataTask*)add:(MSOItem* )entity :(void (^)(MSOItem *item, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOItemFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOItemFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSOItem class]];
}
@end
