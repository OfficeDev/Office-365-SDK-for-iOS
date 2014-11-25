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

#import "MSODirectoryDirectoryObjectFetcher.h"
#import "MSODirectoryDirectoryObjectFetcher.h"
#import "MSODirectoryDirectoryObjectCollectionFetcher.h"
#import "MSODirectoryDirectoryObjectFetcher.h"
#import "MSODirectoryDirectoryObjectCollectionFetcher.h"
#import "MSODirectoryDirectoryObjectCollectionFetcher.h"
#import "MSODirectoryDirectoryObjectCollectionFetcher.h"
#import "MSODirectoryDirectoryObjectCollectionFetcher.h"
#import "MSODirectoryDirectoryObjectCollectionFetcher.h"


/**
* The implementation file for type MSODirectoryDirectoryObjectFetcher.
*/


@implementation MSODirectoryDirectoryObjectFetcher

-(MSODirectoryDirectoryObjectOperations*) getOperations{
	return [[MSODirectoryDirectoryObjectOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataReadable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSODirectoryDirectoryObject class]];
}


-(MSODirectoryDirectoryObjectFetcher*) getcreatedOnBehalfOf{
	 return [[MSODirectoryDirectoryObjectFetcher alloc] initWithUrl:@"createdOnBehalfOf" parent:self andEntityClass: [MSODirectoryDirectoryObject class]];
}


-(MSODirectoryDirectoryObjectCollectionFetcher*) getcreatedObjects{
    return [[MSODirectoryDirectoryObjectCollectionFetcher alloc] initWithUrl:@"createdObjects" parent:self andEntityClass:[MSODirectoryDirectoryObject class]];
}


-(MSODirectoryDirectoryObjectFetcher*) getmanager{
	 return [[MSODirectoryDirectoryObjectFetcher alloc] initWithUrl:@"manager" parent:self andEntityClass: [MSODirectoryDirectoryObject class]];
}


-(MSODirectoryDirectoryObjectCollectionFetcher*) getdirectReports{
    return [[MSODirectoryDirectoryObjectCollectionFetcher alloc] initWithUrl:@"directReports" parent:self andEntityClass:[MSODirectoryDirectoryObject class]];
}


-(MSODirectoryDirectoryObjectCollectionFetcher*) getmembers{
    return [[MSODirectoryDirectoryObjectCollectionFetcher alloc] initWithUrl:@"members" parent:self andEntityClass:[MSODirectoryDirectoryObject class]];
}


-(MSODirectoryDirectoryObjectCollectionFetcher*) getmemberOf{
    return [[MSODirectoryDirectoryObjectCollectionFetcher alloc] initWithUrl:@"memberOf" parent:self andEntityClass:[MSODirectoryDirectoryObject class]];
}


-(MSODirectoryDirectoryObjectCollectionFetcher*) getowners{
    return [[MSODirectoryDirectoryObjectCollectionFetcher alloc] initWithUrl:@"owners" parent:self andEntityClass:[MSODirectoryDirectoryObject class]];
}


-(MSODirectoryDirectoryObjectCollectionFetcher*) getownedObjects{
    return [[MSODirectoryDirectoryObjectCollectionFetcher alloc] initWithUrl:@"ownedObjects" parent:self andEntityClass:[MSODirectoryDirectoryObject class]];
}



	
-(MSODirectoryApplicationFetcher*) asApplication{
	return [[MSODirectoryApplicationFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSODirectoryUserFetcher*) asUser{
	return [[MSODirectoryUserFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSODirectoryExtensionPropertyFetcher*) asExtensionProperty{
	return [[MSODirectoryExtensionPropertyFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSODirectoryContactFetcher*) asContact{
	return [[MSODirectoryContactFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSODirectoryDeviceFetcher*) asDevice{
	return [[MSODirectoryDeviceFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSODirectoryDeviceConfigurationFetcher*) asDeviceConfiguration{
	return [[MSODirectoryDeviceConfigurationFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSODirectoryDirectoryLinkChangeFetcher*) asDirectoryLinkChange{
	return [[MSODirectoryDirectoryLinkChangeFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSODirectoryAppRoleAssignmentFetcher*) asAppRoleAssignment{
	return [[MSODirectoryAppRoleAssignmentFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSODirectoryGroupFetcher*) asGroup{
	return [[MSODirectoryGroupFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSODirectoryDirectoryRoleFetcher*) asDirectoryRole{
	return [[MSODirectoryDirectoryRoleFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSODirectoryDirectoryRoleTemplateFetcher*) asDirectoryRoleTemplate{
	return [[MSODirectoryDirectoryRoleTemplateFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSODirectoryServicePrincipalFetcher*) asServicePrincipal{
	return [[MSODirectoryServicePrincipalFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}
	
-(MSODirectoryTenantDetailFetcher*) asTenantDetail{
	return [[MSODirectoryTenantDetailFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:nil];
}@end