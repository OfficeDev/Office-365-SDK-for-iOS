/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

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
	return [[MSDirectoryUserOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSDirectoryUser class]];
}

-(MSDirectoryAppRoleAssignmentCollectionFetcher*) getappRoleAssignments{
    return [[MSDirectoryAppRoleAssignmentCollectionFetcher alloc] initWith:@"appRoleAssignments" :self : [MSDirectoryAppRoleAssignment class]];
}

-(MSDirectoryOAuth2PermissionGrantCollectionFetcher*) getoauth2PermissionGrants{
    return [[MSDirectoryOAuth2PermissionGrantCollectionFetcher alloc] initWith:@"oauth2PermissionGrants" :self : [MSDirectoryOAuth2PermissionGrant class]];
}

-(MSDirectoryDirectoryObjectCollectionFetcher*) getownedDevices{
    return [[MSDirectoryDirectoryObjectCollectionFetcher alloc] initWith:@"ownedDevices" :self : [MSDirectoryDirectoryObject class]];
}

-(MSDirectoryDirectoryObjectCollectionFetcher*) getregisteredDevices{
    return [[MSDirectoryDirectoryObjectCollectionFetcher alloc] initWith:@"registeredDevices" :self : [MSDirectoryDirectoryObject class]];
}


@end