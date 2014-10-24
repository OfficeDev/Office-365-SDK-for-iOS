/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSGroupCollectionFetcher.h"

/**
* The implementation file for type MSGroupCollectionFetcher.
*/

@implementation MSGroupCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSGroup class]];
}

-(NSURLSessionDataTask*)add:(MSGroup* )entity :(void (^)(MSGroup *group, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSGroupFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSGroupFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSGroup class]];
}
@end
