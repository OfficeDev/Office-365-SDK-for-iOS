/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "MSOServiceInfoCollectionFetcher.h"

#import "MSOServiceInfoCollectionFetcher.h"


#import "MSOBaseODataContainer.h"

/**
* The header for type MSOEntityContainerClient.
*/

@interface MSOEntityContainerClient : MSOBaseODataContainer

-(id)initWitUrl : (NSString *)url  dependencyResolver : (id<MSODependencyResolver>) resolver;
-(MSOServiceInfoCollectionFetcher*) getAllServices;
-(MSOServiceInfoCollectionFetcher*) getServices;

@end
