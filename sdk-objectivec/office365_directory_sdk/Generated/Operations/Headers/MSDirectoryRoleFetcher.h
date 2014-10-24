/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"
#import "MSDirectoryRoleOperations.h"
#import "MSDirectoryRole.h"

/**
* The header for type MSDirectoryRoleFetcher.
*/

@protocol MSDirectoryRoleFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSDirectoryRole* directoryRole, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSDirectoryRole*, NSError * error))callback;
@end

@interface MSDirectoryRoleFetcher : MSODataEntityFetcher<MSDirectoryRoleFetcher>

-(MSDirectoryRoleOperations*) getOperations;
	
@end