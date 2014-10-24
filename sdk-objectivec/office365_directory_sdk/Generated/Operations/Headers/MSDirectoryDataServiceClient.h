/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "MSDirectoryObjectCollectionFetcher.h"

#import "MSOAuth2PermissionGrantCollectionFetcher.h"

#import "MSSubscribedSkuCollectionFetcher.h"

#import "MSDirectoryObjectCollectionFetcher.h"


#import "MSBaseODataContainer.h"

/**
* The header for type MSDirectoryDataServiceClient.
*/

@interface MSDirectoryDataServiceClient : MSBaseODataContainer

-(id)initWitUrl : (NSString *)url  dependencyResolver : (id<MSDependencyResolver>) resolver;
-(MSDirectoryObjectCollectionFetcher*) getdirectoryObjects;
-(MSOAuth2PermissionGrantCollectionFetcher*) getoauth2PermissionGrants;
-(MSSubscribedSkuCollectionFetcher*) getsubscribedSkus;
-(MSDirectoryObjectCollectionFetcher*) getdeletedDirectoryObjects;

@end
