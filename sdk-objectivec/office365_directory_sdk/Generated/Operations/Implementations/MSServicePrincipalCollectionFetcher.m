/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSServicePrincipalCollectionFetcher.h"

/**
* The implementation file for type MSServicePrincipalCollectionFetcher.
*/

@implementation MSServicePrincipalCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSServicePrincipal class]];
}

-(NSURLSessionDataTask*)add:(MSServicePrincipal* )entity :(void (^)(MSServicePrincipal *servicePrincipal, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSServicePrincipalFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSServicePrincipalFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSServicePrincipal class]];
}
@end
