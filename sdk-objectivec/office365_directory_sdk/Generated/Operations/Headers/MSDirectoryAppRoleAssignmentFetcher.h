/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryODataEntityFetcher.h"
#import "MSDirectoryAppRoleAssignmentOperations.h"
#import "MSDirectoryAppRoleAssignment.h"

/**
* The header for type MSDirectoryAppRoleAssignmentFetcher.
*/

@protocol MSDirectoryAppRoleAssignmentFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSDirectoryAppRoleAssignment* appRoleAssignment, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSDirectoryAppRoleAssignment*, NSError * error))callback;
@end

@interface MSDirectoryAppRoleAssignmentFetcher : MSDirectoryODataEntityFetcher<MSDirectoryAppRoleAssignmentFetcher>

-(MSDirectoryAppRoleAssignmentOperations*) getOperations;
	
@end