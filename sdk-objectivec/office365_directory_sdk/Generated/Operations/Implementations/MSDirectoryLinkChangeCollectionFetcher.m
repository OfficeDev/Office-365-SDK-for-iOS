/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryLinkChangeCollectionFetcher.h"

/**
* The implementation file for type MSDirectoryLinkChangeCollectionFetcher.
*/

@implementation MSDirectoryLinkChangeCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSDirectoryLinkChange class]];
}

-(NSURLSessionDataTask*)add:(MSDirectoryLinkChange* )entity :(void (^)(MSDirectoryLinkChange *directoryLinkChange, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSDirectoryLinkChangeFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSDirectoryLinkChangeFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSDirectoryLinkChange class]];
}
@end
