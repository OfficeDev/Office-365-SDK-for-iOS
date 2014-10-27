/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

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
	return [[MSDirectoryDirectoryObjectOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSDirectoryDirectoryObject class]];
}

-(MSDirectoryDirectoryObjectFetcher*) getcreatedOnBehalfOf{
	 return [[MSDirectoryDirectoryObjectFetcher alloc] initWith:@"createdOnBehalfOf" :self : [MSDirectoryDirectoryObject class]];
}

-(MSDirectoryDirectoryObjectCollectionFetcher*) getcreatedObjects{
    return [[MSDirectoryDirectoryObjectCollectionFetcher alloc] initWith:@"createdObjects" :self : [MSDirectoryDirectoryObject class]];
}

-(MSDirectoryDirectoryObjectFetcher*) getmanager{
	 return [[MSDirectoryDirectoryObjectFetcher alloc] initWith:@"manager" :self : [MSDirectoryDirectoryObject class]];
}

-(MSDirectoryDirectoryObjectCollectionFetcher*) getdirectReports{
    return [[MSDirectoryDirectoryObjectCollectionFetcher alloc] initWith:@"directReports" :self : [MSDirectoryDirectoryObject class]];
}

-(MSDirectoryDirectoryObjectCollectionFetcher*) getmembers{
    return [[MSDirectoryDirectoryObjectCollectionFetcher alloc] initWith:@"members" :self : [MSDirectoryDirectoryObject class]];
}

-(MSDirectoryDirectoryObjectCollectionFetcher*) getmemberOf{
    return [[MSDirectoryDirectoryObjectCollectionFetcher alloc] initWith:@"memberOf" :self : [MSDirectoryDirectoryObject class]];
}

-(MSDirectoryDirectoryObjectCollectionFetcher*) getowners{
    return [[MSDirectoryDirectoryObjectCollectionFetcher alloc] initWith:@"owners" :self : [MSDirectoryDirectoryObject class]];
}

-(MSDirectoryDirectoryObjectCollectionFetcher*) getownedObjects{
    return [[MSDirectoryDirectoryObjectCollectionFetcher alloc] initWith:@"ownedObjects" :self : [MSDirectoryDirectoryObject class]];
}

	
-(MSDirectoryApplicationFetcher*) asApplication{
	return [[MSDirectoryApplicationFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSDirectoryApplication class]];
}	
		
-(MSDirectoryUserFetcher*) asUser{
	return [[MSDirectoryUserFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSDirectoryUser class]];
}	
		
-(MSDirectoryExtensionPropertyFetcher*) asExtensionProperty{
	return [[MSDirectoryExtensionPropertyFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSDirectoryExtensionProperty class]];
}	
		
-(MSDirectoryContactFetcher*) asContact{
	return [[MSDirectoryContactFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSDirectoryContact class]];
}	
		
-(MSDirectoryDeviceFetcher*) asDevice{
	return [[MSDirectoryDeviceFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSDirectoryDevice class]];
}	
		
-(MSDirectoryDeviceConfigurationFetcher*) asDeviceConfiguration{
	return [[MSDirectoryDeviceConfigurationFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSDirectoryDeviceConfiguration class]];
}	
		
-(MSDirectoryDirectoryLinkChangeFetcher*) asDirectoryLinkChange{
	return [[MSDirectoryDirectoryLinkChangeFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSDirectoryDirectoryLinkChange class]];
}	
		
-(MSDirectoryAppRoleAssignmentFetcher*) asAppRoleAssignment{
	return [[MSDirectoryAppRoleAssignmentFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSDirectoryAppRoleAssignment class]];
}	
		
-(MSDirectoryGroupFetcher*) asGroup{
	return [[MSDirectoryGroupFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSDirectoryGroup class]];
}	
		
-(MSDirectoryDirectoryRoleFetcher*) asDirectoryRole{
	return [[MSDirectoryDirectoryRoleFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSDirectoryDirectoryRole class]];
}	
		
-(MSDirectoryDirectoryRoleTemplateFetcher*) asDirectoryRoleTemplate{
	return [[MSDirectoryDirectoryRoleTemplateFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSDirectoryDirectoryRoleTemplate class]];
}	
		
-(MSDirectoryServicePrincipalFetcher*) asServicePrincipal{
	return [[MSDirectoryServicePrincipalFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSDirectoryServicePrincipal class]];
}	
		
-(MSDirectoryTenantDetailFetcher*) asTenantDetail{
	return [[MSDirectoryTenantDetailFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSDirectoryTenantDetail class]];
}	
	
@end