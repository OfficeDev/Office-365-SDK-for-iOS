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

#import "MSDirectoryTenantDetailCollectionFetcher.h"

/**
* The implementation file for type MSDirectoryTenantDetailCollectionFetcher.
*/

@implementation MSDirectoryTenantDetailCollectionFetcher

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;{
    return [super initWithUrl:urlComponent parent:parent andEntityClass:[MSDirectoryTenantDetail class]];
}

-(NSURLSessionDataTask*)addTenantDetail:(MSDirectoryTenantDetail*)entity withCallback:(void (^)(MSDirectoryTenantDetail *tenantDetail, MSODataException *e))callback{
	
	return [super add:entity :^(id r, MSODataException *e) {
        callback(r,e);
    }];
}

-(MSDirectoryTenantDetailFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSDirectoryTenantDetailFetcher alloc] initWithUrl:[[NSString alloc] initWithFormat:@"('%@')" ,Id] parent : self andEntityClass :[MSDirectoryTenantDetail class]];
}
@end