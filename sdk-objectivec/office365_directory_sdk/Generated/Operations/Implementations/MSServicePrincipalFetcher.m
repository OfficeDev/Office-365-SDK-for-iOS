/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSServicePrincipalFetcher.h"
#import "MSAppRoleAssignmentCollectionFetcher.h"
#import "MSAppRoleAssignmentCollectionFetcher.h"
#import "MSOAuth2PermissionGrantCollectionFetcher.h"


/**
* The implementation file for type MSServicePrincipalFetcher.
*/


@implementation MSServicePrincipalFetcher
-(MSServicePrincipalOperations*) getOperations{
	return [[MSServicePrincipalOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSServicePrincipal class]];
}

-(MSAppRoleAssignmentCollectionFetcher*) getappRoleAssignedTo{
    return [[MSAppRoleAssignmentCollectionFetcher alloc] initWith:@"appRoleAssignedTo" :self : [MSAppRoleAssignment class]];
}

-(MSAppRoleAssignmentCollectionFetcher*) getappRoleAssignments{
    return [[MSAppRoleAssignmentCollectionFetcher alloc] initWith:@"appRoleAssignments" :self : [MSAppRoleAssignment class]];
}

-(MSOAuth2PermissionGrantCollectionFetcher*) getoauth2PermissionGrants{
    return [[MSOAuth2PermissionGrantCollectionFetcher alloc] initWith:@"oauth2PermissionGrants" :self : [MSOAuth2PermissionGrant class]];
}


@end