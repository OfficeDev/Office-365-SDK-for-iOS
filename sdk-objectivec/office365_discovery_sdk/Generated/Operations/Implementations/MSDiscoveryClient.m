/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDiscoveryClient.h"

/**
* The implementation file for type MSDiscoveryClient.
*/

@implementation MSDiscoveryClient

-(id)initWitUrl:(NSString *)url dependencyResolver:(id<MSDependencyResolver>)resolver{
    return [super initWitUrl:url dependencyResolver:resolver];
}
-(MSServiceInfoCollectionFetcher*) getallServices{
	return [[MSServiceInfoCollectionFetcher alloc] initWith:@"allServices" :self];
}
-(MSServiceInfoCollectionFetcher*) getservices{
	return [[MSServiceInfoCollectionFetcher alloc] initWith:@"services" :self];
}

@end
