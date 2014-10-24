/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"
#import "MSAppRoleAssignmentOperations.h"
#import "MSAppRoleAssignment.h"

/**
* The header for type MSAppRoleAssignmentFetcher.
*/

@protocol MSAppRoleAssignmentFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSAppRoleAssignment* appRoleAssignment, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSAppRoleAssignment*, NSError * error))callback;
@end

@interface MSAppRoleAssignmentFetcher : MSODataEntityFetcher<MSAppRoleAssignmentFetcher>

-(MSAppRoleAssignmentOperations*) getOperations;
	
@end