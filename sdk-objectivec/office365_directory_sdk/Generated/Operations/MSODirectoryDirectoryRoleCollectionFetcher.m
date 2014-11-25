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

#import "MSODirectoryDirectoryRoleCollectionFetcher.h"

/**
* The implementation file for type MSODirectoryDirectoryRoleCollectionFetcher.
*/

@implementation MSODirectoryDirectoryRoleCollectionFetcher

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;{
    return [super initWithUrl:urlComponent parent:parent andEntityClass:[MSODirectoryDirectoryRole class]];
}

-(NSURLSessionDataTask*)addEntity:(MSODirectoryDirectoryRole*)entity withCallback:(void (^)(MSODirectoryDirectoryRole *directoryRole, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSODirectoryDirectoryRoleFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSODirectoryDirectoryRoleFetcher alloc] initWithUrl:[[NSString alloc] initWithFormat:@"('%@')" ,Id] parent : self andEntityClass :[MSODirectoryDirectoryRole class]];
}
@end