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
#import "MSDirectoryServicePrincipalOperations.h"
#import "MSDirectoryServicePrincipal.h"
@class MSDirectoryAppRoleAssignmentCollectionFetcher;
@class MSDirectoryAppRoleAssignmentCollectionFetcher;
@class MSDirectoryOAuth2PermissionGrantCollectionFetcher;


/**
* The header for type MSDirectoryServicePrincipalFetcher.
*/

@protocol MSDirectoryServicePrincipalFetcher

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSDirectoryServicePrincipal* servicePrincipal, NSError *error))callback;
-(NSURLSessionDataTask*) updateServicePrincipal:(id)entity withCallback:(void (^)(MSDirectoryServicePrincipal*, NSError * error))callback;
-(NSURLSessionDataTask*) deleteServicePrincipal:(void (^)(int status, NSError * error))callback;

@end

@interface MSDirectoryServicePrincipalFetcher : MSODataEntityFetcher<MSDirectoryServicePrincipalFetcher>

-(MSDirectoryServicePrincipalOperations*) getOperations;

-(MSDirectoryAppRoleAssignmentCollectionFetcher*) getappRoleAssignedTo;

-(MSDirectoryAppRoleAssignmentCollectionFetcher*) getappRoleAssignments;

-(MSDirectoryOAuth2PermissionGrantCollectionFetcher*) getoauth2PermissionGrants;

	
@end