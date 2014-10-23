/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "MSServiceInfoCollectionFetcher.h"

#import "MSServiceInfoCollectionFetcher.h"


#import "MSBaseODataContainer.h"

/**
* The header for type MSDiscoveryClient.
*/

@interface MSDiscoveryClient : MSBaseODataContainer

-(id)initWitUrl : (NSString *)url  dependencyResolver : (id<MSDependencyResolver>) resolver;
-(MSServiceInfoCollectionFetcher*) getallServices;
-(MSServiceInfoCollectionFetcher*) getservices;

@end
