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

#import "MSODirectoryDirectoryClient.h"
/**
* The implementation file for type MSODirectoryDirectoryClient.
*/

@implementation MSODirectoryDirectoryClient

-(id)initWithUrl:(NSString *)url dependencyResolver:(id<MSODataDependencyResolver>)resolver{
    return [super initWithUrl:url dependencyResolver:resolver];
}

-(MSODirectoryDirectoryObjectCollectionFetcher*) getdirectoryObjects{
	return [[MSODirectoryDirectoryObjectCollectionFetcher alloc] initWithUrl:@"directoryObjects" parent:self];
}

-(MSODirectoryOAuth2PermissionGrantCollectionFetcher*) getoauth2PermissionGrants{
	return [[MSODirectoryOAuth2PermissionGrantCollectionFetcher alloc] initWithUrl:@"oauth2PermissionGrants" parent:self];
}

-(MSODirectorySubscribedSkuCollectionFetcher*) getsubscribedSkus{
	return [[MSODirectorySubscribedSkuCollectionFetcher alloc] initWithUrl:@"subscribedSkus" parent:self];
}

-(MSODirectoryDirectoryObjectCollectionFetcher*) getdeletedDirectoryObjects{
	return [[MSODirectoryDirectoryObjectCollectionFetcher alloc] initWithUrl:@"deletedDirectoryObjects" parent:self];
}

-(MSODirectoryUserCollectionFetcher*) getusers{
	return [[MSODirectoryUserCollectionFetcher alloc] initWithUrl:@"users" parent:self];
}

-(MSODirectoryApplicationCollectionFetcher*) getapplications{
	return [[MSODirectoryApplicationCollectionFetcher alloc] initWithUrl:@"applications" parent:self];
}

-(MSODirectoryContactCollectionFetcher*) getcontacts{
	return [[MSODirectoryContactCollectionFetcher alloc] initWithUrl:@"contacts" parent:self];
}

-(MSODirectoryGroupCollectionFetcher*) getgroups{
	return [[MSODirectoryGroupCollectionFetcher alloc] initWithUrl:@"groups" parent:self];
}

-(MSODirectoryDirectoryRoleCollectionFetcher*) getroles{
	return [[MSODirectoryDirectoryRoleCollectionFetcher alloc] initWithUrl:@"roles" parent:self];
}

-(MSODirectoryServicePrincipalCollectionFetcher*) getservicePrincipals{
	return [[MSODirectoryServicePrincipalCollectionFetcher alloc] initWithUrl:@"servicePrincipals" parent:self];
}

-(MSODirectoryTenantDetailCollectionFetcher*) gettenantDetails{
	return [[MSODirectoryTenantDetailCollectionFetcher alloc] initWithUrl:@"tenantDetails" parent:self];
}

-(MSODirectoryDeviceCollectionFetcher*) getdevices{
	return [[MSODirectoryDeviceCollectionFetcher alloc] initWithUrl:@"devices" parent:self];
}

@end