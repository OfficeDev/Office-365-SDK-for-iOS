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

#import "MSODirectoryServicePrincipalFetcher.h"
#import "MSODirectoryAppRoleAssignmentCollectionFetcher.h"
#import "MSODirectoryAppRoleAssignmentCollectionFetcher.h"
#import "MSODirectoryOAuth2PermissionGrantCollectionFetcher.h"


/**
* The implementation file for type MSODirectoryServicePrincipalFetcher.
*/


@implementation MSODirectoryServicePrincipalFetcher

-(MSODirectoryServicePrincipalOperations*) getOperations{
	return [[MSODirectoryServicePrincipalOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataReadable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSODirectoryServicePrincipal class]];
}


-(MSODirectoryAppRoleAssignmentCollectionFetcher*) getappRoleAssignedTo{
    return [[MSODirectoryAppRoleAssignmentCollectionFetcher alloc] initWithUrl:@"appRoleAssignedTo" parent:self andEntityClass:[MSODirectoryAppRoleAssignment class]];
}


-(MSODirectoryAppRoleAssignmentCollectionFetcher*) getappRoleAssignments{
    return [[MSODirectoryAppRoleAssignmentCollectionFetcher alloc] initWithUrl:@"appRoleAssignments" parent:self andEntityClass:[MSODirectoryAppRoleAssignment class]];
}


-(MSODirectoryOAuth2PermissionGrantCollectionFetcher*) getoauth2PermissionGrants{
    return [[MSODirectoryOAuth2PermissionGrantCollectionFetcher alloc] initWithUrl:@"oauth2PermissionGrants" parent:self andEntityClass:[MSODirectoryOAuth2PermissionGrant class]];
}


@end