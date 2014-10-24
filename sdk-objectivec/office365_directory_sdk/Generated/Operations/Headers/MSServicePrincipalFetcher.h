/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"
#import "MSServicePrincipalOperations.h"
#import "MSServicePrincipal.h"
@class MSAppRoleAssignmentCollectionFetcher;
@class MSAppRoleAssignmentCollectionFetcher;
@class MSOAuth2PermissionGrantCollectionFetcher;

/**
* The header for type MSServicePrincipalFetcher.
*/

@protocol MSServicePrincipalFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSServicePrincipal* servicePrincipal, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSServicePrincipal*, NSError * error))callback;
@end

@interface MSServicePrincipalFetcher : MSODataEntityFetcher<MSServicePrincipalFetcher>

-(MSServicePrincipalOperations*) getOperations;
-(MSAppRoleAssignmentCollectionFetcher*) getappRoleAssignedTo;
-(MSAppRoleAssignmentCollectionFetcher*) getappRoleAssignments;
-(MSOAuth2PermissionGrantCollectionFetcher*) getoauth2PermissionGrants;
	
@end