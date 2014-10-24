/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"
#import "MSDirectoryRoleTemplateOperations.h"
#import "MSDirectoryRoleTemplate.h"

/**
* The header for type MSDirectoryRoleTemplateFetcher.
*/

@protocol MSDirectoryRoleTemplateFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSDirectoryRoleTemplate* directoryRoleTemplate, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSDirectoryRoleTemplate*, NSError * error))callback;
@end

@interface MSDirectoryRoleTemplateFetcher : MSODataEntityFetcher<MSDirectoryRoleTemplateFetcher>

-(MSDirectoryRoleTemplateOperations*) getOperations;
	
@end