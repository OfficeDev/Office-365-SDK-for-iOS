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

#import "MSODiscoveryDiscoveryClient.h"

/**
* The implementation file for type MSODiscoveryDiscoveryClient.
*/

@implementation MSODiscoveryDiscoveryClient

-(id)initWithUrl:(NSString *)url dependencyResolver:(id<MSODataDependencyResolver>)resolver{
    return [super initWithUrl:url dependencyResolver:resolver];
}

-(MSODiscoveryServiceInfoCollectionFetcher*) getallServices{
	return [[MSODiscoveryServiceInfoCollectionFetcher alloc] initWithUrl:@"allServices" parent:self];
}

-(MSODiscoveryServiceInfoCollectionFetcher*) getservices{
	return [[MSODiscoveryServiceInfoCollectionFetcher alloc] initWithUrl:@"services" parent:self];
}

@end