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

#import "MSDirectoryServicePrincipalFetcher.h"
#import "MSDirectoryAppRoleAssignmentCollectionFetcher.h"
#import "MSDirectoryAppRoleAssignmentCollectionFetcher.h"
#import "MSDirectoryOAuth2PermissionGrantCollectionFetcher.h"


/**
* The implementation file for type MSDirectoryServicePrincipalFetcher.
*/


@implementation MSDirectoryServicePrincipalFetcher

-(MSDirectoryServicePrincipalOperations*) getOperations{
	return [[MSDirectoryServicePrincipalOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSDirectoryServicePrincipal class]];
}

-(NSURLSessionDataTask*) updateServicePrincipal:(id)entity withCallback:(void (^)(MSDirectoryServicePrincipal*, MSODataException * error))callback{
	return [super update:entity : callback];
}

-(NSURLSessionDataTask*) deleteServicePrincipal:(void (^)(int status, MSODataException * error))callback{
	return [super delete:callback];
}


-(MSDirectoryAppRoleAssignmentCollectionFetcher*) getappRoleAssignedTo{
    return [[MSDirectoryAppRoleAssignmentCollectionFetcher alloc] initWithUrl:@"appRoleAssignedTo" parent:self andEntityClass:[MSDirectoryAppRoleAssignment class]];
}

-(MSDirectoryAppRoleAssignmentFetcher*) getappRoleAssignedToById : (NSString*)_id{
    return [[[MSDirectoryAppRoleAssignmentCollectionFetcher alloc] initWithUrl:@"appRoleAssignedTo" parent:self andEntityClass:[MSDirectoryAppRoleAssignment class]] getById:_id];
}

-(MSDirectoryAppRoleAssignmentCollectionFetcher*) getappRoleAssignments{
    return [[MSDirectoryAppRoleAssignmentCollectionFetcher alloc] initWithUrl:@"appRoleAssignments" parent:self andEntityClass:[MSDirectoryAppRoleAssignment class]];
}

-(MSDirectoryAppRoleAssignmentFetcher*) getappRoleAssignmentsById : (NSString*)_id{
    return [[[MSDirectoryAppRoleAssignmentCollectionFetcher alloc] initWithUrl:@"appRoleAssignments" parent:self andEntityClass:[MSDirectoryAppRoleAssignment class]] getById:_id];
}

-(MSDirectoryOAuth2PermissionGrantCollectionFetcher*) getoauth2PermissionGrants{
    return [[MSDirectoryOAuth2PermissionGrantCollectionFetcher alloc] initWithUrl:@"oauth2PermissionGrants" parent:self andEntityClass:[MSDirectoryOAuth2PermissionGrant class]];
}

-(MSDirectoryOAuth2PermissionGrantFetcher*) getoauth2PermissionGrantsById : (NSString*)_id{
    return [[[MSDirectoryOAuth2PermissionGrantCollectionFetcher alloc] initWithUrl:@"oauth2PermissionGrants" parent:self andEntityClass:[MSDirectoryOAuth2PermissionGrant class]] getById:_id];
}

@end