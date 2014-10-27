/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryODataEntityFetcher.h"
#import "MSDirectoryDirectoryRoleTemplateOperations.h"
#import "MSDirectoryDirectoryRoleTemplate.h"

/**
* The header for type MSDirectoryDirectoryRoleTemplateFetcher.
*/

@protocol MSDirectoryDirectoryRoleTemplateFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSDirectoryDirectoryRoleTemplate* directoryRoleTemplate, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSDirectoryDirectoryRoleTemplate*, NSError * error))callback;
@end

@interface MSDirectoryDirectoryRoleTemplateFetcher : MSDirectoryODataEntityFetcher<MSDirectoryDirectoryRoleTemplateFetcher>

-(MSDirectoryDirectoryRoleTemplateOperations*) getOperations;
	
@end