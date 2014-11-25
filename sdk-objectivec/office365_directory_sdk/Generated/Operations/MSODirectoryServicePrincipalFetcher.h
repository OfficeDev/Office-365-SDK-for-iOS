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
#import "MSODirectoryServicePrincipalOperations.h"
#import "MSODirectoryServicePrincipal.h"
@class MSODirectoryAppRoleAssignmentCollectionFetcher;
@class MSODirectoryAppRoleAssignmentCollectionFetcher;
@class MSODirectoryOAuth2PermissionGrantCollectionFetcher;


/**
* The header for type MSODirectoryServicePrincipalFetcher.
*/

@protocol MSODirectoryServicePrincipalFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSODirectoryServicePrincipal* servicePrincipal, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSODirectoryServicePrincipal*, NSError * error))callback;
@end

@interface MSODirectoryServicePrincipalFetcher : MSODataEntityFetcher<MSODirectoryServicePrincipalFetcher>

-(MSODirectoryServicePrincipalOperations*) getOperations;

-(MSODirectoryAppRoleAssignmentCollectionFetcher*) getappRoleAssignedTo;

-(MSODirectoryAppRoleAssignmentCollectionFetcher*) getappRoleAssignments;

-(MSODirectoryOAuth2PermissionGrantCollectionFetcher*) getoauth2PermissionGrants;

	
@end