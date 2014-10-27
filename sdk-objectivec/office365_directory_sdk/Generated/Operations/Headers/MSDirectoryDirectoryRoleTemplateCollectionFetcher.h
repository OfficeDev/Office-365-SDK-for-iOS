/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryDirectoryRoleTemplate.h"
#import "MSDirectoryODataCollectionFetcher.h"
#import "MSDirectoryDirectoryRoleTemplateFetcher.h"

/**
* The header for type MSDirectoryDirectoryRoleTemplateCollectionFetcher.
*/

@protocol MSDirectoryDirectoryRoleTemplateCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSDirectoryDirectoryRoleTemplate> *directoryRoleTemplates, NSError *error))callback;

@end

@interface MSDirectoryDirectoryRoleTemplateCollectionFetcher : MSDirectoryODataCollectionFetcher<MSDirectoryDirectoryRoleTemplateCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSDirectoryDirectoryRoleTemplate* )entity :(void (^)(MSDirectoryDirectoryRoleTemplate *directoryRoleTemplate, NSError *e))callback;

-(MSDirectoryDirectoryRoleTemplateFetcher*)getById:(NSString *)Id;

@end
