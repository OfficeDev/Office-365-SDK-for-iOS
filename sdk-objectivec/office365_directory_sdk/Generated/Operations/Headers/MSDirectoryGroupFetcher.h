/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryODataEntityFetcher.h"
#import "MSDirectoryGroupOperations.h"
#import "MSDirectoryGroup.h"
@class MSDirectoryAppRoleAssignmentCollectionFetcher;

/**
* The header for type MSDirectoryGroupFetcher.
*/

@protocol MSDirectoryGroupFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSDirectoryGroup* group, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSDirectoryGroup*, NSError * error))callback;
@end

@interface MSDirectoryGroupFetcher : MSDirectoryODataEntityFetcher<MSDirectoryGroupFetcher>

-(MSDirectoryGroupOperations*) getOperations;
-(MSDirectoryAppRoleAssignmentCollectionFetcher*) getappRoleAssignments;
	
@end