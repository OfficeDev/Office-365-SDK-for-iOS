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

#import "MSODirectoryExtensionPropertyCollectionFetcher.h"

/**
* The implementation file for type MSODirectoryExtensionPropertyCollectionFetcher.
*/

@implementation MSODirectoryExtensionPropertyCollectionFetcher

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;{
    return [super initWithUrl:urlComponent parent:parent andEntityClass:[MSODirectoryExtensionProperty class]];
}

-(NSURLSessionDataTask*)addEntity:(MSODirectoryExtensionProperty*)entity withCallback:(void (^)(MSODirectoryExtensionProperty *extensionProperty, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSODirectoryExtensionPropertyFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSODirectoryExtensionPropertyFetcher alloc] initWithUrl:[[NSString alloc] initWithFormat:@"('%@')" ,Id] parent : self andEntityClass :[MSODirectoryExtensionProperty class]];
}
@end