/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryClient.h"

/**
* The implementation file for type MSDirectoryClient.
*/

@implementation MSDirectoryClient

-(id)initWitUrl:(NSString *)url dependencyResolver:(id<MSDependencyResolver>)resolver{
    return [super initWitUrl:url dependencyResolver:resolver];
}
-(MSDirectoryDirectoryObjectCollectionFetcher*) getdirectoryObjects{
	return [[MSDirectoryDirectoryObjectCollectionFetcher alloc] initWith:@"directoryObjects" :self];
}
-(MSDirectoryOAuth2PermissionGrantCollectionFetcher*) getoauth2PermissionGrants{
	return [[MSDirectoryOAuth2PermissionGrantCollectionFetcher alloc] initWith:@"oauth2PermissionGrants" :self];
}
-(MSDirectorySubscribedSkuCollectionFetcher*) getsubscribedSkus{
	return [[MSDirectorySubscribedSkuCollectionFetcher alloc] initWith:@"subscribedSkus" :self];
}
-(MSDirectoryDirectoryObjectCollectionFetcher*) getdeletedDirectoryObjects{
	return [[MSDirectoryDirectoryObjectCollectionFetcher alloc] initWith:@"deletedDirectoryObjects" :self];
}
-(MSDirectoryUserCollectionFetcher*) getusers{
	return [[MSDirectoryUserCollectionFetcher alloc] initWith:@"users" :self];
}
-(MSDirectoryApplicationCollectionFetcher*) getapplications{
	return [[MSDirectoryApplicationCollectionFetcher alloc] initWith:@"applications" :self];
}
-(MSDirectoryContactCollectionFetcher*) getcontacts{
	return [[MSDirectoryContactCollectionFetcher alloc] initWith:@"contacts" :self];
}
-(MSDirectoryGroupCollectionFetcher*) getgroups{
	return [[MSDirectoryGroupCollectionFetcher alloc] initWith:@"groups" :self];
}
-(MSDirectoryDirectoryRoleCollectionFetcher*) getroles{
	return [[MSDirectoryDirectoryRoleCollectionFetcher alloc] initWith:@"roles" :self];
}
-(MSDirectoryServicePrincipalCollectionFetcher*) getservicePrincipals{
	return [[MSDirectoryServicePrincipalCollectionFetcher alloc] initWith:@"servicePrincipals" :self];
}
-(MSDirectoryTenantDetailCollectionFetcher*) gettenantDetails{
	return [[MSDirectoryTenantDetailCollectionFetcher alloc] initWith:@"tenantDetails" :self];
}
-(MSDirectoryDeviceCollectionFetcher*) getdevices{
	return [[MSDirectoryDeviceCollectionFetcher alloc] initWith:@"devices" :self];
}

@end
