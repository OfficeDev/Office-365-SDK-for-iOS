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

#import "MSDirectoryUserFetcher.h"
#import "MSDirectoryAppRoleAssignmentCollectionFetcher.h"
#import "MSDirectoryOAuth2PermissionGrantCollectionFetcher.h"
#import "MSDirectoryDirectoryObjectCollectionFetcher.h"
#import "MSDirectoryDirectoryObjectCollectionFetcher.h"


/**
* The implementation file for type MSDirectoryUserFetcher.
*/


@implementation MSDirectoryUserFetcher

-(MSDirectoryUserOperations*) getOperations{
	return [[MSDirectoryUserOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSDirectoryUser class]];
}

-(NSURLSessionDataTask*) updateUser:(id)entity withCallback:(void (^)(MSDirectoryUser*, MSODataException * error))callback{
	return [super update:entity : callback];
}

-(NSURLSessionDataTask*) deleteUser:(void (^)(int status, MSODataException * error))callback{
	return [super delete:callback];
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

-(MSDirectoryDirectoryObjectCollectionFetcher*) getownedDevices{
    return [[MSDirectoryDirectoryObjectCollectionFetcher alloc] initWithUrl:@"ownedDevices" parent:self andEntityClass:[MSDirectoryDirectoryObject class]];
}

-(MSDirectoryDirectoryObjectFetcher*) getownedDevicesById : (NSString*)_id{
    return [[[MSDirectoryDirectoryObjectCollectionFetcher alloc] initWithUrl:@"ownedDevices" parent:self andEntityClass:[MSDirectoryDirectoryObject class]] getById:_id];
}

-(MSDirectoryDirectoryObjectCollectionFetcher*) getregisteredDevices{
    return [[MSDirectoryDirectoryObjectCollectionFetcher alloc] initWithUrl:@"registeredDevices" parent:self andEntityClass:[MSDirectoryDirectoryObject class]];
}

-(MSDirectoryDirectoryObjectFetcher*) getregisteredDevicesById : (NSString*)_id{
    return [[[MSDirectoryDirectoryObjectCollectionFetcher alloc] initWithUrl:@"registeredDevices" parent:self andEntityClass:[MSDirectoryDirectoryObject class]] getById:_id];
}

@end