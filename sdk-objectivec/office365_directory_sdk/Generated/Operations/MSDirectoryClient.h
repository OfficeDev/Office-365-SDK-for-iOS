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

#import <office365_odata_base/office365_odata_base.h>
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


/**
* The header for type MSDirectoryClient.
*/

@interface MSDirectoryClient : MSODataBaseContainer

-(id)initWithUrl : (NSString *)url  dependencyResolver : (id<MSODataDependencyResolver>) resolver;

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