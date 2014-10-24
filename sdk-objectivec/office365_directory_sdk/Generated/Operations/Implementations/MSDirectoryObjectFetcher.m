/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryObjectFetcher.h"
#import "MSDirectoryObjectFetcher.h"
#import "MSDirectoryObjectCollectionFetcher.h"
#import "MSDirectoryObjectFetcher.h"
#import "MSDirectoryObjectCollectionFetcher.h"
#import "MSDirectoryObjectCollectionFetcher.h"
#import "MSDirectoryObjectCollectionFetcher.h"
#import "MSDirectoryObjectCollectionFetcher.h"
#import "MSDirectoryObjectCollectionFetcher.h"


/**
* The implementation file for type MSDirectoryObjectFetcher.
*/


@implementation MSDirectoryObjectFetcher
-(MSDirectoryObjectOperations*) getOperations{
	return [[MSDirectoryObjectOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSDirectoryObject class]];
}

-(MSDirectoryObjectFetcher*) getcreatedOnBehalfOf{
	 return [[MSDirectoryObjectFetcher alloc] initWith:@"createdOnBehalfOf" :self : [MSDirectoryObject class]];
}

-(MSDirectoryObjectCollectionFetcher*) getcreatedObjects{
    return [[MSDirectoryObjectCollectionFetcher alloc] initWith:@"createdObjects" :self : [MSDirectoryObject class]];
}

-(MSDirectoryObjectFetcher*) getmanager{
	 return [[MSDirectoryObjectFetcher alloc] initWith:@"manager" :self : [MSDirectoryObject class]];
}

-(MSDirectoryObjectCollectionFetcher*) getdirectReports{
    return [[MSDirectoryObjectCollectionFetcher alloc] initWith:@"directReports" :self : [MSDirectoryObject class]];
}

-(MSDirectoryObjectCollectionFetcher*) getmembers{
    return [[MSDirectoryObjectCollectionFetcher alloc] initWith:@"members" :self : [MSDirectoryObject class]];
}

-(MSDirectoryObjectCollectionFetcher*) getmemberOf{
    return [[MSDirectoryObjectCollectionFetcher alloc] initWith:@"memberOf" :self : [MSDirectoryObject class]];
}

-(MSDirectoryObjectCollectionFetcher*) getowners{
    return [[MSDirectoryObjectCollectionFetcher alloc] initWith:@"owners" :self : [MSDirectoryObject class]];
}

-(MSDirectoryObjectCollectionFetcher*) getownedObjects{
    return [[MSDirectoryObjectCollectionFetcher alloc] initWith:@"ownedObjects" :self : [MSDirectoryObject class]];
}

	
-(MSApplicationFetcher*) asApplication{
	return [[MSApplicationFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSApplication class]];
}	
		
-(MSUserFetcher*) asUser{
	return [[MSUserFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSUser class]];
}	
		
-(MSExtensionPropertyFetcher*) asExtensionProperty{
	return [[MSExtensionPropertyFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSExtensionProperty class]];
}	
		
-(MSContactFetcher*) asContact{
	return [[MSContactFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSContact class]];
}	
		
-(MSDeviceFetcher*) asDevice{
	return [[MSDeviceFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSDevice class]];
}	
		
-(MSDeviceConfigurationFetcher*) asDeviceConfiguration{
	return [[MSDeviceConfigurationFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSDeviceConfiguration class]];
}	
		
-(MSDirectoryLinkChangeFetcher*) asDirectoryLinkChange{
	return [[MSDirectoryLinkChangeFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSDirectoryLinkChange class]];
}	
		
-(MSAppRoleAssignmentFetcher*) asAppRoleAssignment{
	return [[MSAppRoleAssignmentFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSAppRoleAssignment class]];
}	
		
-(MSGroupFetcher*) asGroup{
	return [[MSGroupFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSGroup class]];
}	
		
-(MSDirectoryRoleFetcher*) asDirectoryRole{
	return [[MSDirectoryRoleFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSDirectoryRole class]];
}	
		
-(MSDirectoryRoleTemplateFetcher*) asDirectoryRoleTemplate{
	return [[MSDirectoryRoleTemplateFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSDirectoryRoleTemplate class]];
}	
		
-(MSServicePrincipalFetcher*) asServicePrincipal{
	return [[MSServicePrincipalFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSServicePrincipal class]];
}	
		
-(MSTenantDetailFetcher*) asTenantDetail{
	return [[MSTenantDetailFetcher alloc] initWith :self.UrlComponent :self.Parent :[MSTenantDetail class]];
}	
	
@end