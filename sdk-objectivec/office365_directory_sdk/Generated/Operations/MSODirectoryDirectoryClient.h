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

#import <office365_odata_base/office365_odata_base.h>#import "MSODirectoryDirectoryObjectCollectionFetcher.h"

#import "MSODirectoryOAuth2PermissionGrantCollectionFetcher.h"

#import "MSODirectorySubscribedSkuCollectionFetcher.h"

#import "MSODirectoryDirectoryObjectCollectionFetcher.h"

#import "MSODirectoryUserCollectionFetcher.h"

#import "MSODirectoryApplicationCollectionFetcher.h"

#import "MSODirectoryContactCollectionFetcher.h"

#import "MSODirectoryGroupCollectionFetcher.h"

#import "MSODirectoryDirectoryRoleCollectionFetcher.h"

#import "MSODirectoryServicePrincipalCollectionFetcher.h"

#import "MSODirectoryTenantDetailCollectionFetcher.h"

#import "MSODirectoryDeviceCollectionFetcher.h"


/**
* The header for type MSODirectoryDirectoryClient.
*/

@interface MSODirectoryDirectoryClient : MSODataBaseContainer

-(id)initWithUrl : (NSString *)url  dependencyResolver : (id<MSODataDependencyResolver>) resolver;

-(MSODirectoryDirectoryObjectCollectionFetcher*) getdirectoryObjects;

-(MSODirectoryOAuth2PermissionGrantCollectionFetcher*) getoauth2PermissionGrants;

-(MSODirectorySubscribedSkuCollectionFetcher*) getsubscribedSkus;

-(MSODirectoryDirectoryObjectCollectionFetcher*) getdeletedDirectoryObjects;

-(MSODirectoryUserCollectionFetcher*) getusers;

-(MSODirectoryApplicationCollectionFetcher*) getapplications;

-(MSODirectoryContactCollectionFetcher*) getcontacts;

-(MSODirectoryGroupCollectionFetcher*) getgroups;

-(MSODirectoryDirectoryRoleCollectionFetcher*) getroles;

-(MSODirectoryServicePrincipalCollectionFetcher*) getservicePrincipals;

-(MSODirectoryTenantDetailCollectionFetcher*) gettenantDetails;

-(MSODirectoryDeviceCollectionFetcher*) getdevices;

@end