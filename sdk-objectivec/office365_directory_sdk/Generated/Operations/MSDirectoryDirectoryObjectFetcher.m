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

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataReadable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSDirectoryDirectoryObject class]];
}

-(NSURLSessionDataTask*) updateDirectoryObject:(id)entity withCallback:(void (^)(MSDirectoryDirectoryObject*, NSError * error))callback{
	return [super update:entity : callback];
}

-(NSURLSessionDataTask*) deleteDirectoryObject:(void (^)(int status, NSError * error))callback{
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
	return [[MSDirectoryApplicationFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSDirectoryUserFetcher*) asUser{
	return [[MSDirectoryUserFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSDirectoryExtensionPropertyFetcher*) asExtensionProperty{
	return [[MSDirectoryExtensionPropertyFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSDirectoryContactFetcher*) asContact{
	return [[MSDirectoryContactFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSDirectoryDeviceFetcher*) asDevice{
	return [[MSDirectoryDeviceFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSDirectoryDeviceConfigurationFetcher*) asDeviceConfiguration{
	return [[MSDirectoryDeviceConfigurationFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSDirectoryDirectoryLinkChangeFetcher*) asDirectoryLinkChange{
	return [[MSDirectoryDirectoryLinkChangeFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSDirectoryAppRoleAssignmentFetcher*) asAppRoleAssignment{
	return [[MSDirectoryAppRoleAssignmentFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSDirectoryGroupFetcher*) asGroup{
	return [[MSDirectoryGroupFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSDirectoryDirectoryRoleFetcher*) asDirectoryRole{
	return [[MSDirectoryDirectoryRoleFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSDirectoryDirectoryRoleTemplateFetcher*) asDirectoryRoleTemplate{
	return [[MSDirectoryDirectoryRoleTemplateFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSDirectoryServicePrincipalFetcher*) asServicePrincipal{
	return [[MSDirectoryServicePrincipalFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSDirectoryTenantDetailFetcher*) asTenantDetail{
	return [[MSDirectoryTenantDetailFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}@end