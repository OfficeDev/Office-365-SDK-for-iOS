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
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSDirectoryDirectoryRoleTemplate> *directoryRoleTemplates, MSODataException *error))callback;

-(id<MSDirectoryDirectoryRoleTemplateCollectionFetcher>)select : (NSString*) params;
-(id<MSDirectoryDirectoryRoleTemplateCollectionFetcher>)filter : (NSString*) params;
-(id<MSDirectoryDirectoryRoleTemplateCollectionFetcher>)top : (int) value;
-(id<MSDirectoryDirectoryRoleTemplateCollectionFetcher>)skip : (int) value;
-(id<MSDirectoryDirectoryRoleTemplateCollectionFetcher>)expand : (NSString*) value;
-(id<MSDirectoryDirectoryRoleTemplateCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSDirectoryDirectoryRoleTemplateCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSDirectoryDirectoryRoleTemplateCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
@end

@interface MSDirectoryDirectoryRoleTemplateCollectionFetcher : MSODataCollectionFetcher<MSDirectoryDirectoryRoleTemplateCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSDirectoryDirectoryRoleTemplateFetcher*)getById:(NSString *)Id;
-(NSURLSessionDataTask*)addDirectoryRoleTemplate:(MSDirectoryDirectoryRoleTemplate* )entity withCallback:(void (^)(MSDirectoryDirectoryRoleTemplate *directoryRoleTemplate, MSODataException *e))callback;

@end