/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOAuth2PermissionGrantCollectionFetcher.h"

/**
* The implementation file for type MSOAuth2PermissionGrantCollectionFetcher.
*/

@implementation MSOAuth2PermissionGrantCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;{
    return [super initWith:urlComponent :parent : [MSOAuth2PermissionGrant class]];
}

-(NSURLSessionDataTask*)add:(MSOAuth2PermissionGrant* )entity :(void (^)(MSOAuth2PermissionGrant *oAuth2PermissionGrant, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSOAuth2PermissionGrantFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSOAuth2PermissionGrantFetcher alloc] initWith:[[NSString alloc] initWithFormat:@"('%@')" ,Id] : self :[MSOAuth2PermissionGrant class]];
}
@end
