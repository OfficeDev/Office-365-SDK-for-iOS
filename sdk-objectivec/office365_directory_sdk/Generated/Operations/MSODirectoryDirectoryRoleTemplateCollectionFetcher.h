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
#import "MSODirectoryDirectoryRoleTemplate.h"
#import "MSODirectoryDirectoryRoleTemplateFetcher.h"

/**
* The header for type MSODirectoryDirectoryRoleTemplateCollectionFetcher.
*/

@protocol MSODirectoryDirectoryRoleTemplateCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSODirectoryDirectoryRoleTemplate> *directoryRoleTemplates, NSError *error))callback;

@end

@interface MSODirectoryDirectoryRoleTemplateCollectionFetcher : MSODataCollectionFetcher<MSODirectoryDirectoryRoleTemplateCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSODirectoryDirectoryRoleTemplate* )entity withCallback:(void (^)(MSODirectoryDirectoryRoleTemplate *directoryRoleTemplate, NSError *e))callback;

-(MSODirectoryDirectoryRoleTemplateFetcher*)getById:(NSString *)Id;

@end