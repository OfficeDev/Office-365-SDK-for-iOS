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

#import "MSDirectoryDirectoryObjectFetcher.h"
#import "MSDirectoryDirectoryObjectFetcher.h"
#import "MSDirectoryDirectoryObjectCollectionFetcher.h"
#import "MSDirectoryDirectoryObjectFetcher.h"
#import "MSDirectoryDirectoryObjectCollectionFetcher.h"
#import "MSDirectoryDirectoryObjectCollectionFetcher.h"
#import "MSDirectoryDirectoryObjectCollectionFetcher.h"
#import "MSDirectoryDirectoryObjectCollectionFetcher.h"
#import "MSDirectoryDirectoryObjectCollectionFetcher.h"


/**
* The implementation file for type MSDirectoryDirectoryObjectFetcher.
*/


@implementation MSDirectoryDirectoryObjectFetcher

-(MSDirectoryDirectoryObjectOperations*) getOperations{
	return [[MSDirectoryDirectoryObjectOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSDirectoryDirectoryObject class]];
}

-(NSURLSessionDataTask*) updateDirectoryObject:(id)entity withCallback:(void (^)(MSDirectoryDirectoryObject*, MSODataException * error))callback{
	return [super update:entity : callback];
}

-(NSURLSessionDataTask*) deleteDirectoryObject:(void (^)(int status, MSODataException * error))callback{
	return [super delete:callback];
}


-(MSDirectoryDirectoryObjectFetcher*) getcreatedOnBehalfOf{
	 return [[MSDirectoryDirectoryObjectFetcher alloc] initWithUrl:@"createdOnBehalfOf" parent:self andEntityClass: [MSDirectoryDirectoryObject class]];
}


-(MSDirectoryDirectoryObjectCollectionFetcher*) getcreatedObjects{
    return [[MSDirectoryDirectoryObjectCollectionFetcher alloc] initWithUrl:@"createdObjects" parent:self andEntityClass:[MSDirectoryDirectoryObject class]];
}


-(MSDirectoryDirectoryObjectFetcher*) getmanager{
	 return [[MSDirectoryDirectoryObjectFetcher alloc] initWithUrl:@"manager" parent:self andEntityClass: [MSDirectoryDirectoryObject class]];
}


-(MSDirectoryDirectoryObjectCollectionFetcher*) getdirectReports{
    return [[MSDirectoryDirectoryObjectCollectionFetcher alloc] initWithUrl:@"directReports" parent:self andEntityClass:[MSDirectoryDirectoryObject class]];
}


-(MSDirectoryDirectoryObjectCollectionFetcher*) getmembers{
    return [[MSDirectoryDirectoryObjectCollectionFetcher alloc] initWithUrl:@"members" parent:self andEntityClass:[MSDirectoryDirectoryObject class]];
}


-(MSDirectoryDirectoryObjectCollectionFetcher*) getmemberOf{
    return [[MSDirectoryDirectoryObjectCollectionFetcher alloc] initWithUrl:@"memberOf" parent:self andEntityClass:[MSDirectoryDirectoryObject class]];
}


-(MSDirectoryDirectoryObjectCollectionFetcher*) getowners{
    return [[MSDirectoryDirectoryObjectCollectionFetcher alloc] initWithUrl:@"owners" parent:self andEntityClass:[MSDirectoryDirectoryObject class]];
}


-(MSDirectoryDirectoryObjectCollectionFetcher*) getownedObjects{
    return [[MSDirectoryDirectoryObjectCollectionFetcher alloc] initWithUrl:@"ownedObjects" parent:self andEntityClass:[MSDirectoryDirectoryObject class]];
}



	
-(MSDirectoryApplicationFetcher*) asApplication{
	return [[MSDirectoryApplicationFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSDirectoryApplication class]];
}
	
-(MSDirectoryUserFetcher*) asUser{
	return [[MSDirectoryUserFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSDirectoryUser class]];
}
	
-(MSDirectoryExtensionPropertyFetcher*) asExtensionProperty{
	return [[MSDirectoryExtensionPropertyFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSDirectoryExtensionProperty class]];
}
	
-(MSDirectoryContactFetcher*) asContact{
	return [[MSDirectoryContactFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSDirectoryContact class]];
}
	
-(MSDirectoryDeviceFetcher*) asDevice{
	return [[MSDirectoryDeviceFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSDirectoryDevice class]];
}
	
-(MSDirectoryDeviceConfigurationFetcher*) asDeviceConfiguration{
	return [[MSDirectoryDeviceConfigurationFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSDirectoryDeviceConfiguration class]];
}
	
-(MSDirectoryDirectoryLinkChangeFetcher*) asDirectoryLinkChange{
	return [[MSDirectoryDirectoryLinkChangeFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSDirectoryDirectoryLinkChange class]];
}
	
-(MSDirectoryAppRoleAssignmentFetcher*) asAppRoleAssignment{
	return [[MSDirectoryAppRoleAssignmentFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSDirectoryAppRoleAssignment class]];
}
	
-(MSDirectoryGroupFetcher*) asGroup{
	return [[MSDirectoryGroupFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSDirectoryGroup class]];
}
	
-(MSDirectoryDirectoryRoleFetcher*) asDirectoryRole{
	return [[MSDirectoryDirectoryRoleFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSDirectoryDirectoryRole class]];
}
	
-(MSDirectoryDirectoryRoleTemplateFetcher*) asDirectoryRoleTemplate{
	return [[MSDirectoryDirectoryRoleTemplateFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSDirectoryDirectoryRoleTemplate class]];
}
	
-(MSDirectoryServicePrincipalFetcher*) asServicePrincipal{
	return [[MSDirectoryServicePrincipalFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSDirectoryServicePrincipal class]];
}
	
-(MSDirectoryTenantDetailFetcher*) asTenantDetail{
	return [[MSDirectoryTenantDetailFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSDirectoryTenantDetail class]];
}@end