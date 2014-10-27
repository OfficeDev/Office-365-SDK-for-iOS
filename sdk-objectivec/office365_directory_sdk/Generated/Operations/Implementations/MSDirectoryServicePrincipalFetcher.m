/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryServicePrincipalFetcher.h"
#import "MSDirectoryAppRoleAssignmentCollectionFetcher.h"
#import "MSDirectoryAppRoleAssignmentCollectionFetcher.h"
#import "MSDirectoryOAuth2PermissionGrantCollectionFetcher.h"


/**
* The implementation file for type MSDirectoryServicePrincipalFetcher.
*/


@implementation MSDirectoryServicePrincipalFetcher
-(MSDirectoryServicePrincipalOperations*) getOperations{
	return [[MSDirectoryServicePrincipalOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSDirectoryServicePrincipal class]];
}

-(MSDirectoryAppRoleAssignmentCollectionFetcher*) getappRoleAssignedTo{
    return [[MSDirectoryAppRoleAssignmentCollectionFetcher alloc] initWith:@"appRoleAssignedTo" :self : [MSDirectoryAppRoleAssignment class]];
}

-(MSDirectoryAppRoleAssignmentCollectionFetcher*) getappRoleAssignments{
    return [[MSDirectoryAppRoleAssignmentCollectionFetcher alloc] initWith:@"appRoleAssignments" :self : [MSDirectoryAppRoleAssignment class]];
}

-(MSDirectoryOAuth2PermissionGrantCollectionFetcher*) getoauth2PermissionGrants{
    return [[MSDirectoryOAuth2PermissionGrantCollectionFetcher alloc] initWith:@"oauth2PermissionGrants" :self : [MSDirectoryOAuth2PermissionGrant class]];
}


@end