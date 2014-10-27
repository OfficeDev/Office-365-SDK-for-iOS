/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryGroupCollectionFetcher.h"

/**
* The implementation file for type MSDirectoryGroupCollectionFetcher.
*/

@implementation MSDirectoryGroupCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSDirectoryGroup class]];
}

-(NSURLSessionDataTask*)add:(MSDirectoryGroup* )entity :(void (^)(MSDirectoryGroup *group, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSDirectoryGroupFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSDirectoryGroupFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSDirectoryGroup class]];
}
@end
