/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSUserFetcher.h"
#import "MSAppRoleAssignmentCollectionFetcher.h"
#import "MSOAuth2PermissionGrantCollectionFetcher.h"
#import "MSDirectoryObjectCollectionFetcher.h"
#import "MSDirectoryObjectCollectionFetcher.h"


/**
* The implementation file for type MSUserFetcher.
*/


@implementation MSUserFetcher
-(MSUserOperations*) getOperations{
	return [[MSUserOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSUser class]];
}

-(MSAppRoleAssignmentCollectionFetcher*) getappRoleAssignments{
    return [[MSAppRoleAssignmentCollectionFetcher alloc] initWith:@"appRoleAssignments" :self : [MSAppRoleAssignment class]];
}

-(MSOAuth2PermissionGrantCollectionFetcher*) getoauth2PermissionGrants{
    return [[MSOAuth2PermissionGrantCollectionFetcher alloc] initWith:@"oauth2PermissionGrants" :self : [MSOAuth2PermissionGrant class]];
}

-(MSDirectoryObjectCollectionFetcher*) getownedDevices{
    return [[MSDirectoryObjectCollectionFetcher alloc] initWith:@"ownedDevices" :self : [MSDirectoryObject class]];
}

-(MSDirectoryObjectCollectionFetcher*) getregisteredDevices{
    return [[MSDirectoryObjectCollectionFetcher alloc] initWith:@"registeredDevices" :self : [MSDirectoryObject class]];
}


@end