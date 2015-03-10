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

@class MSGraphServiceApplicationCollectionFetcher;
@class MSGraphServiceContactCollectionFetcher;
@class MSGraphServiceDeviceConfigurationCollectionFetcher;
@class MSGraphServiceDeviceCollectionFetcher;
@class MSGraphServiceGroupCollectionFetcher;
@class MSGraphServiceDirectoryRoleCollectionFetcher;
@class MSGraphServiceDirectoryRoleTemplateCollectionFetcher;
@class MSGraphServiceServicePrincipalCollectionFetcher;
@class MSGraphServiceTenantDetailCollectionFetcher;
@class MSGraphServiceUserCollectionFetcher;
@class MSGraphServiceOAuth2PermissionGrantCollectionFetcher;
@class MSGraphServiceSubscribedSkuCollectionFetcher;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceClient.
*/

@interface MSGraphServiceClient : MSODataBaseContainer

-(id)initWithUrl : (NSString *)url  dependencyResolver : (id<MSODataDependencyResolver>) resolver;
-(MSGraphServiceApplicationCollectionFetcher*) getapplications;
-(MSGraphServiceContactCollectionFetcher*) getcontacts;
-(MSGraphServiceDeviceConfigurationCollectionFetcher*) getdeviceConfiguration;
-(MSGraphServiceDeviceCollectionFetcher*) getdevices;
-(MSGraphServiceGroupCollectionFetcher*) getgroups;
-(MSGraphServiceDirectoryRoleCollectionFetcher*) getdirectoryRoles;
-(MSGraphServiceDirectoryRoleTemplateCollectionFetcher*) getdirectoryRoleTemplates;
-(MSGraphServiceServicePrincipalCollectionFetcher*) getservicePrincipals;
-(MSGraphServiceTenantDetailCollectionFetcher*) gettenantDetails;
-(MSGraphServiceUserCollectionFetcher*) getusers;
-(MSGraphServiceOAuth2PermissionGrantCollectionFetcher*) getoauth2PermissionGrants;
-(MSGraphServiceSubscribedSkuCollectionFetcher*) getsubscribedSkus;

@end