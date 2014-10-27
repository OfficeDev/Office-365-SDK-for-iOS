/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryServicePrincipalCollectionFetcher.h"

/**
* The implementation file for type MSDirectoryServicePrincipalCollectionFetcher.
*/

@implementation MSDirectoryServicePrincipalCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSDirectoryServicePrincipal class]];
}

-(NSURLSessionDataTask*)add:(MSDirectoryServicePrincipal* )entity :(void (^)(MSDirectoryServicePrincipal *servicePrincipal, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSDirectoryServicePrincipalFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSDirectoryServicePrincipalFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSDirectoryServicePrincipal class]];
}
@end
