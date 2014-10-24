/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"
#import "MSUserOperations.h"
#import "MSUser.h"
@class MSAppRoleAssignmentCollectionFetcher;
@class MSOAuth2PermissionGrantCollectionFetcher;
@class MSDirectoryObjectCollectionFetcher;
@class MSDirectoryObjectCollectionFetcher;

/**
* The header for type MSUserFetcher.
*/

@protocol MSUserFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSUser* user, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSUser*, NSError * error))callback;
@end

@interface MSUserFetcher : MSODataEntityFetcher<MSUserFetcher>

-(MSUserOperations*) getOperations;
-(MSAppRoleAssignmentCollectionFetcher*) getappRoleAssignments;
-(MSOAuth2PermissionGrantCollectionFetcher*) getoauth2PermissionGrants;
-(MSDirectoryObjectCollectionFetcher*) getownedDevices;
-(MSDirectoryObjectCollectionFetcher*) getregisteredDevices;
	
@end