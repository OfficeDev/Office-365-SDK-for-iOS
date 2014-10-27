/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryOAuth2PermissionGrantCollectionFetcher.h"

/**
* The implementation file for type MSDirectoryOAuth2PermissionGrantCollectionFetcher.
*/

@implementation MSDirectoryOAuth2PermissionGrantCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSDirectoryOAuth2PermissionGrant class]];
}

-(NSURLSessionDataTask*)add:(MSDirectoryOAuth2PermissionGrant* )entity :(void (^)(MSDirectoryOAuth2PermissionGrant *oAuth2PermissionGrant, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSDirectoryOAuth2PermissionGrantFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSDirectoryOAuth2PermissionGrantFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSDirectoryOAuth2PermissionGrant class]];
}
@end
