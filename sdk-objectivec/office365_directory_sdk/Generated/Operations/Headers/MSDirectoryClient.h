/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "MSDirectoryDirectoryObjectCollectionFetcher.h"

#import "MSDirectoryOAuth2PermissionGrantCollectionFetcher.h"

#import "MSDirectorySubscribedSkuCollectionFetcher.h"

#import "MSDirectoryDirectoryObjectCollectionFetcher.h"

#import "MSDirectoryUserCollectionFetcher.h"

#import "MSDirectoryApplicationCollectionFetcher.h"

#import "MSDirectoryContactCollectionFetcher.h"

#import "MSDirectoryGroupCollectionFetcher.h"

#import "MSDirectoryDirectoryRoleCollectionFetcher.h"

#import "MSDirectoryServicePrincipalCollectionFetcher.h"

#import "MSDirectoryTenantDetailCollectionFetcher.h"

#import "MSDirectoryDeviceCollectionFetcher.h"


#import "MSDirectoryBaseODataContainer.h"

/**
* The header for type MSDirectoryClient.
*/

@interface MSDirectoryClient : MSDirectoryBaseODataContainer

-(id)initWitUrl : (NSString *)url  dependencyResolver : (id<MSDependencyResolver>) resolver;
-(MSDirectoryDirectoryObjectCollectionFetcher*) getdirectoryObjects;
-(MSDirectoryOAuth2PermissionGrantCollectionFetcher*) getoauth2PermissionGrants;
-(MSDirectorySubscribedSkuCollectionFetcher*) getsubscribedSkus;
-(MSDirectoryDirectoryObjectCollectionFetcher*) getdeletedDirectoryObjects;
-(MSDirectoryUserCollectionFetcher*) getusers;
-(MSDirectoryApplicationCollectionFetcher*) getapplications;
-(MSDirectoryContactCollectionFetcher*) getcontacts;
-(MSDirectoryGroupCollectionFetcher*) getgroups;
-(MSDirectoryDirectoryRoleCollectionFetcher*) getroles;
-(MSDirectoryServicePrincipalCollectionFetcher*) getservicePrincipals;
-(MSDirectoryTenantDetailCollectionFetcher*) gettenantDetails;
-(MSDirectoryDeviceCollectionFetcher*) getdevices;

@end
