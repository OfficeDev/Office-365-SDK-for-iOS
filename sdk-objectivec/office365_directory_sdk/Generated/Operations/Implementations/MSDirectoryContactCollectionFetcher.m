/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryContactCollectionFetcher.h"

/**
* The implementation file for type MSDirectoryContactCollectionFetcher.
*/

@implementation MSDirectoryContactCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSDirectoryContact class]];
}

-(NSURLSessionDataTask*)add:(MSDirectoryContact* )entity :(void (^)(MSDirectoryContact *contact, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSDirectoryContactFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSDirectoryContactFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSDirectoryContact class]];
}
@end
