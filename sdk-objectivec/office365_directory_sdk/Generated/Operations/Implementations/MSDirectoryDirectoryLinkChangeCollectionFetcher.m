/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryDirectoryLinkChangeCollectionFetcher.h"

/**
* The implementation file for type MSDirectoryDirectoryLinkChangeCollectionFetcher.
*/

@implementation MSDirectoryDirectoryLinkChangeCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSDirectoryDirectoryLinkChange class]];
}

-(NSURLSessionDataTask*)add:(MSDirectoryDirectoryLinkChange* )entity :(void (^)(MSDirectoryDirectoryLinkChange *directoryLinkChange, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSDirectoryDirectoryLinkChangeFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSDirectoryDirectoryLinkChangeFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSDirectoryDirectoryLinkChange class]];
}
@end
