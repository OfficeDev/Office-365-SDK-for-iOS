/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryODataEntityFetcher.h"
#import "MSDirectoryDirectoryRoleOperations.h"
#import "MSDirectoryDirectoryRole.h"

/**
* The header for type MSDirectoryDirectoryRoleFetcher.
*/

@protocol MSDirectoryDirectoryRoleFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSDirectoryDirectoryRole* directoryRole, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSDirectoryDirectoryRole*, NSError * error))callback;
@end

@interface MSDirectoryDirectoryRoleFetcher : MSDirectoryODataEntityFetcher<MSDirectoryDirectoryRoleFetcher>

-(MSDirectoryDirectoryRoleOperations*) getOperations;
	
@end