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

@class MSGraphServiceDirectoryRoleTemplateFetcher;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceDirectoryRoleTemplateCollectionFetcher.
*/

@protocol MSGraphServiceDirectoryRoleTemplateCollectionFetcher<MSODataCollectionFetcher>

@optional
-(NSURLSessionTask*)read:(void (^)(NSArray<MSGraphServiceDirectoryRoleTemplate> *directoryRoleTemplates, MSODataException *error))callback;

-(id<MSGraphServiceDirectoryRoleTemplateCollectionFetcher>)select : (NSString*) params;
-(id<MSGraphServiceDirectoryRoleTemplateCollectionFetcher>)filter : (NSString*) params;
-(id<MSGraphServiceDirectoryRoleTemplateCollectionFetcher>)top : (int) value;
-(id<MSGraphServiceDirectoryRoleTemplateCollectionFetcher>)skip : (int) value;
-(id<MSGraphServiceDirectoryRoleTemplateCollectionFetcher>)expand : (NSString*) value;
-(id<MSGraphServiceDirectoryRoleTemplateCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSGraphServiceDirectoryRoleTemplateCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceDirectoryRoleTemplateCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@required

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSGraphServiceDirectoryRoleTemplateFetcher*)getById:(NSString *)Id;
-(NSURLSessionTask*)addDirectoryRoleTemplate:(MSGraphServiceDirectoryRoleTemplate* )entity withCallback:(void (^)(MSGraphServiceDirectoryRoleTemplate *directoryRoleTemplate, MSODataException *e))callback;

@end

@interface MSGraphServiceDirectoryRoleTemplateCollectionFetcher : MSODataCollectionFetcher<MSGraphServiceDirectoryRoleTemplateCollectionFetcher>

@end