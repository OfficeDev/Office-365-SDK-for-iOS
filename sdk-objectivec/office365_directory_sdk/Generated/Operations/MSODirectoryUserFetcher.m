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

#import "MSODirectoryUserFetcher.h"
#import "MSODirectoryAppRoleAssignmentCollectionFetcher.h"
#import "MSODirectoryOAuth2PermissionGrantCollectionFetcher.h"
#import "MSODirectoryDirectoryObjectCollectionFetcher.h"
#import "MSODirectoryDirectoryObjectCollectionFetcher.h"


/**
* The implementation file for type MSODirectoryUserFetcher.
*/


@implementation MSODirectoryUserFetcher

-(MSODirectoryUserOperations*) getOperations{
	return [[MSODirectoryUserOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataReadable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSODirectoryUser class]];
}


-(MSODirectoryAppRoleAssignmentCollectionFetcher*) getappRoleAssignments{
    return [[MSODirectoryAppRoleAssignmentCollectionFetcher alloc] initWithUrl:@"appRoleAssignments" parent:self andEntityClass:[MSODirectoryAppRoleAssignment class]];
}


-(MSODirectoryOAuth2PermissionGrantCollectionFetcher*) getoauth2PermissionGrants{
    return [[MSODirectoryOAuth2PermissionGrantCollectionFetcher alloc] initWithUrl:@"oauth2PermissionGrants" parent:self andEntityClass:[MSODirectoryOAuth2PermissionGrant class]];
}


-(MSODirectoryDirectoryObjectCollectionFetcher*) getownedDevices{
    return [[MSODirectoryDirectoryObjectCollectionFetcher alloc] initWithUrl:@"ownedDevices" parent:self andEntityClass:[MSODirectoryDirectoryObject class]];
}


-(MSODirectoryDirectoryObjectCollectionFetcher*) getregisteredDevices{
    return [[MSODirectoryDirectoryObjectCollectionFetcher alloc] initWithUrl:@"registeredDevices" parent:self andEntityClass:[MSODirectoryDirectoryObject class]];
}


@end