/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "MSDiscoveryServiceInfoCollectionFetcher.h"
#import "MSDiscoveryServiceInfoCollectionFetcher.h"
#import "MSDiscoveryBaseODataContainer.h"

/**
* The header for type MSDiscoveryClient.
*/

@interface MSDiscoveryClient : MSDiscoveryBaseODataContainer

-(id)initWitUrl : (NSString *)url  dependencyResolver : (id<MSDependencyResolver>) resolver;
-(MSDiscoveryServiceInfoCollectionFetcher*) getallServices;
-(MSDiscoveryServiceInfoCollectionFetcher*) getservices;

@end
