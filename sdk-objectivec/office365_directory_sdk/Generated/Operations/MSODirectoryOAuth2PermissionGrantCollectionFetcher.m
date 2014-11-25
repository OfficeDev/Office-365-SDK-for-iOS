/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 *
 * Warning: This code was generated automatically. Edits will be overwritten.
 * To make changes to this code, please make changes to the generation framework itself:
 * https://github.com/MSOpenTech/odata-codegen
 *******************************************************************************/

#import "MSODirectoryOAuth2PermissionGrantCollectionFetcher.h"

/**
* The implementation file for type MSODirectoryOAuth2PermissionGrantCollectionFetcher.
*/

@implementation MSODirectoryOAuth2PermissionGrantCollectionFetcher

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;{
    return [super initWithUrl:urlComponent parent:parent andEntityClass:[MSODirectoryOAuth2PermissionGrant class]];
}

-(NSURLSessionDataTask*)addEntity:(MSODirectoryOAuth2PermissionGrant*)entity withCallback:(void (^)(MSODirectoryOAuth2PermissionGrant *oAuth2PermissionGrant, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSODirectoryOAuth2PermissionGrantFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSODirectoryOAuth2PermissionGrantFetcher alloc] initWithUrl:[[NSString alloc] initWithFormat:@"('%@')" ,Id] parent : self andEntityClass :[MSODirectoryOAuth2PermissionGrant class]];
}
@end