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

#import "MSGraphServiceODataEntities.h"

/**
* The implementation file for type MSGraphServiceOAuth2PermissionGrantCollectionFetcher.
*/

@implementation MSGraphServiceOAuth2PermissionGrantCollectionFetcher

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;{
    return [super initWithUrl:urlComponent parent:parent andEntityClass:[MSGraphServiceOAuth2PermissionGrant class]];
}

-(NSURLSessionTask*)addOAuth2PermissionGrant:(MSGraphServiceOAuth2PermissionGrant*)entity withCallback:(void (^)(MSGraphServiceOAuth2PermissionGrant *oAuth2PermissionGrant, MSODataException *e))callback{
	
	return [super add:entity :^(id r, MSODataException *e) {
        callback(r,e);
    }];
}

-(MSGraphServiceOAuth2PermissionGrantFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSGraphServiceOAuth2PermissionGrantFetcher alloc] initWithUrl:[[NSString alloc] initWithFormat:@"('%@')" ,Id] parent : self andEntityClass :[MSGraphServiceOAuth2PermissionGrant class]];
}
@end