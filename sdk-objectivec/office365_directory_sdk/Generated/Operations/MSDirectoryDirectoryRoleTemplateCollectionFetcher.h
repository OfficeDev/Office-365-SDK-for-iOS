/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 *
 * Warning: This code was generated automatically. Edits will be overwritten.
 * To make changes to this code, please make changes to the generation framework itself:
 * https://github.com/MSOpenTech/odata-codegen
 *******************************************************************************/

#import <office365_odata_base/office365_odata_base.h>
#import "MSDirectoryDirectoryRoleTemplate.h"
#import "MSDirectoryDirectoryRoleTemplateFetcher.h"

/**
* The header for type MSDirectoryDirectoryRoleTemplateCollectionFetcher.
*/

@protocol MSDirectoryDirectoryRoleTemplateCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSDirectoryDirectoryRoleTemplate> *directoryRoleTemplates, NSError *error))callback;
-(MSDirectoryDirectoryRoleTemplateFetcher*)select : (NSString*) params;
-(MSDirectoryDirectoryRoleTemplateFetcher*)filter : (NSString*) params;
-(MSDirectoryDirectoryRoleTemplateFetcher*)top : (int) value;
-(MSDirectoryDirectoryRoleTemplateFetcher*)skip : (int) value;
-(MSDirectoryDirectoryRoleTemplateFetcher*)expand : (NSString*) value;
-(MSDirectoryDirectoryRoleTemplateFetcher*)orderBy : (NSString*) params;

@end

@interface MSDirectoryDirectoryRoleTemplateCollectionFetcher : MSODataCollectionFetcher<MSDirectoryDirectoryRoleTemplateCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addDirectoryRoleTemplate:(MSDirectoryDirectoryRoleTemplate* )entity withCallback:(void (^)(MSDirectoryDirectoryRoleTemplate *directoryRoleTemplate, NSError *e))callback;

-(MSDirectoryDirectoryRoleTemplateFetcher*)getById:(NSString *)Id;

@end