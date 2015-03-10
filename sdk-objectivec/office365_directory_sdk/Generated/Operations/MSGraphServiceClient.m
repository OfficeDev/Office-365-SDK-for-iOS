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

#import "MSGraphServiceODataEntities.h"

/**
* The implementation file for type MSGraphServiceClient.
*/

@implementation MSGraphServiceClient

-(id)initWithUrl:(NSString *)url dependencyResolver:(id<MSODataDependencyResolver>)resolver{
    return [super initWithUrl:url dependencyResolver:resolver];
}

-(MSGraphServiceApplicationCollectionFetcher*) getapplications{
	return [[MSGraphServiceApplicationCollectionFetcher alloc] initWithUrl:@"applications" parent:self];
}
-(MSGraphServiceContactCollectionFetcher*) getcontacts{
	return [[MSGraphServiceContactCollectionFetcher alloc] initWithUrl:@"contacts" parent:self];
}
-(MSGraphServiceDeviceConfigurationCollectionFetcher*) getdeviceConfiguration{
	return [[MSGraphServiceDeviceConfigurationCollectionFetcher alloc] initWithUrl:@"deviceConfiguration" parent:self];
}
-(MSGraphServiceDeviceCollectionFetcher*) getdevices{
	return [[MSGraphServiceDeviceCollectionFetcher alloc] initWithUrl:@"devices" parent:self];
}
-(MSGraphServiceGroupCollectionFetcher*) getgroups{
	return [[MSGraphServiceGroupCollectionFetcher alloc] initWithUrl:@"groups" parent:self];
}
-(MSGraphServiceDirectoryRoleCollectionFetcher*) getdirectoryRoles{
	return [[MSGraphServiceDirectoryRoleCollectionFetcher alloc] initWithUrl:@"directoryRoles" parent:self];
}
-(MSGraphServiceDirectoryRoleTemplateCollectionFetcher*) getdirectoryRoleTemplates{
	return [[MSGraphServiceDirectoryRoleTemplateCollectionFetcher alloc] initWithUrl:@"directoryRoleTemplates" parent:self];
}
-(MSGraphServiceServicePrincipalCollectionFetcher*) getservicePrincipals{
	return [[MSGraphServiceServicePrincipalCollectionFetcher alloc] initWithUrl:@"servicePrincipals" parent:self];
}
-(MSGraphServiceTenantDetailCollectionFetcher*) gettenantDetails{
	return [[MSGraphServiceTenantDetailCollectionFetcher alloc] initWithUrl:@"tenantDetails" parent:self];
}
-(MSGraphServiceUserCollectionFetcher*) getusers{
	return [[MSGraphServiceUserCollectionFetcher alloc] initWithUrl:@"users" parent:self];
}
-(MSGraphServiceOAuth2PermissionGrantCollectionFetcher*) getoauth2PermissionGrants{
	return [[MSGraphServiceOAuth2PermissionGrantCollectionFetcher alloc] initWithUrl:@"oauth2PermissionGrants" parent:self];
}
-(MSGraphServiceSubscribedSkuCollectionFetcher*) getsubscribedSkus{
	return [[MSGraphServiceSubscribedSkuCollectionFetcher alloc] initWithUrl:@"subscribedSkus" parent:self];
}
@end