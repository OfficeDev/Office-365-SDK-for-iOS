/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryRoleTemplate.h"
#import "MSODataCollectionFetcher.h"
#import "MSDirectoryRoleTemplateFetcher.h"

/**
* The header for type MSDirectoryRoleTemplateCollectionFetcher.
*/

@protocol MSDirectoryRoleTemplateCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSDirectoryRoleTemplate> *directoryRoleTemplates, NSError *error))callback;

@end

@interface MSDirectoryRoleTemplateCollectionFetcher : MSODataCollectionFetcher<MSDirectoryRoleTemplateCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSDirectoryRoleTemplate* )entity :(void (^)(MSDirectoryRoleTemplate *directoryRoleTemplate, NSError *e))callback;

-(MSDirectoryRoleTemplateFetcher*)getById:(NSString *)Id;

@end
