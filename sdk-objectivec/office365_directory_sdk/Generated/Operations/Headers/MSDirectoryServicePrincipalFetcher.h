/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryODataEntityFetcher.h"
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
-(NSURLSessionDataTask *)execute:(void (^)(MSDirectoryServicePrincipal* servicePrincipal, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSDirectoryServicePrincipal*, NSError * error))callback;
@end

@interface MSDirectoryServicePrincipalFetcher : MSDirectoryODataEntityFetcher<MSDirectoryServicePrincipalFetcher>

-(MSDirectoryServicePrincipalOperations*) getOperations;
-(MSDirectoryAppRoleAssignmentCollectionFetcher*) getappRoleAssignedTo;
-(MSDirectoryAppRoleAssignmentCollectionFetcher*) getappRoleAssignments;
-(MSDirectoryOAuth2PermissionGrantCollectionFetcher*) getoauth2PermissionGrants;
	
@end