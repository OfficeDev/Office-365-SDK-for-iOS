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

#import "MSDirectoryClient.h"
/**
* The implementation file for type MSDirectoryClient.
*/

@implementation MSDirectoryClient

-(id)initWithUrl:(NSString *)url dependencyResolver:(id<MSODataDependencyResolver>)resolver{
    return [super initWithUrl:url dependencyResolver:resolver];
}

-(MSDirectoryDirectoryObjectCollectionFetcher*) getdirectoryObjects{
	return [[MSDirectoryDirectoryObjectCollectionFetcher alloc] initWithUrl:@"directoryObjects" parent:self];
}

-(MSDirectoryOAuth2PermissionGrantCollectionFetcher*) getoauth2PermissionGrants{
	return [[MSDirectoryOAuth2PermissionGrantCollectionFetcher alloc] initWithUrl:@"oauth2PermissionGrants" parent:self];
}

-(MSDirectorySubscribedSkuCollectionFetcher*) getsubscribedSkus{
	return [[MSDirectorySubscribedSkuCollectionFetcher alloc] initWithUrl:@"subscribedSkus" parent:self];
}

-(MSDirectoryDirectoryObjectCollectionFetcher*) getdeletedDirectoryObjects{
	return [[MSDirectoryDirectoryObjectCollectionFetcher alloc] initWithUrl:@"deletedDirectoryObjects" parent:self];
}

-(MSDirectoryUserCollectionFetcher*) getusers{
	return [[MSDirectoryUserCollectionFetcher alloc] initWithUrl:@"users" parent:self];
}

-(MSDirectoryApplicationCollectionFetcher*) getapplications{
	return [[MSDirectoryApplicationCollectionFetcher alloc] initWithUrl:@"applications" parent:self];
}

-(MSDirectoryContactCollectionFetcher*) getcontacts{
	return [[MSDirectoryContactCollectionFetcher alloc] initWithUrl:@"contacts" parent:self];
}

-(MSDirectoryGroupCollectionFetcher*) getgroups{
	return [[MSDirectoryGroupCollectionFetcher alloc] initWithUrl:@"groups" parent:self];
}

-(MSDirectoryDirectoryRoleCollectionFetcher*) getroles{
	return [[MSDirectoryDirectoryRoleCollectionFetcher alloc] initWithUrl:@"roles" parent:self];
}

-(MSDirectoryServicePrincipalCollectionFetcher*) getservicePrincipals{
	return [[MSDirectoryServicePrincipalCollectionFetcher alloc] initWithUrl:@"servicePrincipals" parent:self];
}

-(MSDirectoryTenantDetailCollectionFetcher*) gettenantDetails{
	return [[MSDirectoryTenantDetailCollectionFetcher alloc] initWithUrl:@"tenantDetails" parent:self];
}

-(MSDirectoryDeviceCollectionFetcher*) getdevices{
	return [[MSDirectoryDeviceCollectionFetcher alloc] initWithUrl:@"devices" parent:self];
}

@end