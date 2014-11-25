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

#import "MSODiscoveryServiceInfoCollectionFetcher.h"

/**
* The implementation file for type MSODiscoveryServiceInfoCollectionFetcher.
*/

@implementation MSODiscoveryServiceInfoCollectionFetcher

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;{
    return [super initWithUrl:urlComponent parent:parent andEntityClass:[MSODiscoveryServiceInfo class]];
}

-(NSURLSessionDataTask*)addEntity:(MSODiscoveryServiceInfo*)entity withCallback:(void (^)(MSODiscoveryServiceInfo *serviceInfo, NSError *e))callback{
	return [super add:entity :^(id r, NSError *e) {
        callback(r,e);
    }];
}

-(MSODiscoveryServiceInfoFetcher*)getById:(NSString *)Id{
	[super getById:Id];
    return [[MSODiscoveryServiceInfoFetcher alloc] initWithUrl:[[NSString alloc] initWithFormat:@"('%@')" ,Id] parent : self entityClass :[MSODiscoveryServiceInfo class]];
}
@end