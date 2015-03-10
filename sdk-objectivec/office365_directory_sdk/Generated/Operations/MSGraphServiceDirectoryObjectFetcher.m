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

@implementation MSGraphServiceDirectoryObjectFetcher

-(MSGraphServiceDirectoryObjectOperations*) getOperations{
	return [[MSGraphServiceDirectoryObjectOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataExecutable>)parent{
    self.Parent = parent;
    self.UrlComponent = urlComponent;

    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSGraphServiceDirectoryObject class]];
}

-(NSURLSessionTask*) updateDirectoryObject:(id)entity withCallback:(void (^)(MSGraphServiceDirectoryObject*, MSODataException * error))callback{
	return [super update:entity : callback];
}

-(NSURLSessionTask*) deleteDirectoryObject:(void (^)(int status, MSODataException * error))callback{
	return [super delete:callback];
}

-(MSGraphServiceApplicationFetcher*) asApplication{
	return [[MSGraphServiceApplicationFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSGraphServiceApplication class]];
}
-(MSGraphServiceExtensionPropertyFetcher*) asExtensionProperty{
	return [[MSGraphServiceExtensionPropertyFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSGraphServiceExtensionProperty class]];
}
-(MSGraphServiceUserFetcher*) asUser{
	return [[MSGraphServiceUserFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSGraphServiceUser class]];
}
-(MSGraphServiceAppRoleAssignmentFetcher*) asAppRoleAssignment{
	return [[MSGraphServiceAppRoleAssignmentFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSGraphServiceAppRoleAssignment class]];
}
-(MSGraphServiceContactFetcher*) asContact{
	return [[MSGraphServiceContactFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSGraphServiceContact class]];
}
-(MSGraphServiceDeviceFetcher*) asDevice{
	return [[MSGraphServiceDeviceFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSGraphServiceDevice class]];
}
-(MSGraphServiceDeviceConfigurationFetcher*) asDeviceConfiguration{
	return [[MSGraphServiceDeviceConfigurationFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSGraphServiceDeviceConfiguration class]];
}
-(MSGraphServiceDirectoryLinkChangeFetcher*) asDirectoryLinkChange{
	return [[MSGraphServiceDirectoryLinkChangeFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSGraphServiceDirectoryLinkChange class]];
}
-(MSGraphServiceDirectoryRoleFetcher*) asDirectoryRole{
	return [[MSGraphServiceDirectoryRoleFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSGraphServiceDirectoryRole class]];
}
-(MSGraphServiceDirectoryRoleTemplateFetcher*) asDirectoryRoleTemplate{
	return [[MSGraphServiceDirectoryRoleTemplateFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSGraphServiceDirectoryRoleTemplate class]];
}
-(MSGraphServiceGroupFetcher*) asGroup{
	return [[MSGraphServiceGroupFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSGraphServiceGroup class]];
}
-(MSGraphServiceServicePrincipalFetcher*) asServicePrincipal{
	return [[MSGraphServiceServicePrincipalFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSGraphServiceServicePrincipal class]];
}
-(MSGraphServiceTenantDetailFetcher*) asTenantDetail{
	return [[MSGraphServiceTenantDetailFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSGraphServiceTenantDetail class]];
}

@end