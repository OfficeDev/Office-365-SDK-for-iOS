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
