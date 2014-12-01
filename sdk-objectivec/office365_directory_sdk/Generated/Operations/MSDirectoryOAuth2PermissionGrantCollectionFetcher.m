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

#import "MSDirectoryOAuth2PermissionGrantCollectionFetcher.h"

/**
* The implementation file for type MSDirectoryOAuth2PermissionGrantCollectionFetcher.
*/

@implementation MSDirectoryOAuth2PermissionGrantCollectionFetcher

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;{
    return [super initWithUrl:urlComponent parent:parent andEntityClass:[MSDirectoryOAuth2PermissionGrant class]];
}

-(NSURLSessionDataTask*)addOAuth2PermissionGrant:(MSDirectoryOAuth2PermissionGrant*)entity withCallback:(void (^)(MSDirectoryOAuth2PermissionGrant *oAuth2PermissionGrant, MSODataException *e))callback{
	
	return [super add:entity :^(id r, MSODataException *e) {
        callback(r,e);
    }];
}

-(MSDirectoryOAuth2PermissionGrantFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSDirectoryOAuth2PermissionGrantFetcher alloc] initWithUrl:[[NSString alloc] initWithFormat:@"('%@')" ,Id] parent : self andEntityClass :[MSDirectoryOAuth2PermissionGrant class]];
}
@end