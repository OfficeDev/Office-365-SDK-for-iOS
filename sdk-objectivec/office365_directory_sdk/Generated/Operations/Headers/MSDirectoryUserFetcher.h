/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryODataEntityFetcher.h"
#import "MSDirectoryUserOperations.h"
#import "MSDirectoryUser.h"
@class MSDirectoryAppRoleAssignmentCollectionFetcher;
@class MSDirectoryOAuth2PermissionGrantCollectionFetcher;
@class MSDirectoryDirectoryObjectCollectionFetcher;
@class MSDirectoryDirectoryObjectCollectionFetcher;

/**
* The header for type MSDirectoryUserFetcher.
*/

@protocol MSDirectoryUserFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSDirectoryUser* user, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSDirectoryUser*, NSError * error))callback;
@end

@interface MSDirectoryUserFetcher : MSDirectoryODataEntityFetcher<MSDirectoryUserFetcher>

-(MSDirectoryUserOperations*) getOperations;
-(MSDirectoryAppRoleAssignmentCollectionFetcher*) getappRoleAssignments;
-(MSDirectoryOAuth2PermissionGrantCollectionFetcher*) getoauth2PermissionGrants;
-(MSDirectoryDirectoryObjectCollectionFetcher*) getownedDevices;
-(MSDirectoryDirectoryObjectCollectionFetcher*) getregisteredDevices;
	
@end