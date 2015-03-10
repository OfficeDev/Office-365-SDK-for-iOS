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

#import "MSGraphServiceODataEntities.h"

@implementation MSGraphServiceServicePrincipalFetcher

-(MSGraphServiceServicePrincipalOperations*) getOperations{
	return [[MSGraphServiceServicePrincipalOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataExecutable>)parent{
    self.Parent = parent;
    self.UrlComponent = urlComponent;

    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSGraphServiceServicePrincipal class]];
}

-(NSURLSessionTask*) updateServicePrincipal:(id)entity withCallback:(void (^)(MSGraphServiceServicePrincipal*, MSODataException * error))callback{
	return [super update:entity : callback];
}

-(NSURLSessionTask*) deleteServicePrincipal:(void (^)(int status, MSODataException * error))callback{
	return [super delete:callback];
}

-(MSGraphServiceAppRoleAssignmentFetcher*) getappRoleAssignedTo{
	 return [[MSGraphServiceAppRoleAssignmentFetcher alloc] initWithUrl:@"appRoleAssignedTo" parent:self andEntityClass: [MSGraphServiceAppRoleAssignment class]];
}
-(MSGraphServiceAppRoleAssignmentCollectionFetcher*) getappRoleAssignments{
    return [[MSGraphServiceAppRoleAssignmentCollectionFetcher alloc] initWithUrl:@"appRoleAssignments" parent:self andEntityClass:[MSGraphServiceAppRoleAssignment class]];
}

-(id<MSGraphServiceAppRoleAssignmentFetcher>) getappRoleAssignmentsById : (NSString*)_id{
    return [[[MSGraphServiceAppRoleAssignmentCollectionFetcher alloc] initWithUrl:@"appRoleAssignments" parent:self andEntityClass:[MSGraphServiceAppRoleAssignment class]] getById:_id];
}
-(MSGraphServiceOAuth2PermissionGrantCollectionFetcher*) getoauth2PermissionGrants{
    return [[MSGraphServiceOAuth2PermissionGrantCollectionFetcher alloc] initWithUrl:@"oauth2PermissionGrants" parent:self andEntityClass:[MSGraphServiceOAuth2PermissionGrant class]];
}

-(id<MSGraphServiceOAuth2PermissionGrantFetcher>) getoauth2PermissionGrantsById : (NSString*)_id{
    return [[[MSGraphServiceOAuth2PermissionGrantCollectionFetcher alloc] initWithUrl:@"oauth2PermissionGrants" parent:self andEntityClass:[MSGraphServiceOAuth2PermissionGrant class]] getById:_id];
}
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getmemberOf{
    return [[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"memberOf" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]];
}

-(id<MSGraphServiceDirectoryObjectFetcher>) getmemberOfById : (NSString*)_id{
    return [[[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"memberOf" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]] getById:_id];
}
-(MSGraphServiceDirectoryObjectFetcher*) getcreatedOnBehalfOf{
	 return [[MSGraphServiceDirectoryObjectFetcher alloc] initWithUrl:@"createdOnBehalfOf" parent:self andEntityClass: [MSGraphServiceDirectoryObject class]];
}
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getcreatedObjects{
    return [[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"createdObjects" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]];
}

-(id<MSGraphServiceDirectoryObjectFetcher>) getcreatedObjectsById : (NSString*)_id{
    return [[[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"createdObjects" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]] getById:_id];
}
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getowners{
    return [[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"owners" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]];
}

-(id<MSGraphServiceDirectoryObjectFetcher>) getownersById : (NSString*)_id{
    return [[[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"owners" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]] getById:_id];
}
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getownedObjects{
    return [[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"ownedObjects" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]];
}

-(id<MSGraphServiceDirectoryObjectFetcher>) getownedObjectsById : (NSString*)_id{
    return [[[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"ownedObjects" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]] getById:_id];
}

@end