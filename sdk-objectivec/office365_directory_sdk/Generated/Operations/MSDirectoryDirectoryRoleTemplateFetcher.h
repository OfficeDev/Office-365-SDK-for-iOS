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
#import "MSDirectoryDirectoryRoleTemplateOperations.h"
#import "MSDirectoryDirectoryRoleTemplate.h"


/**
* The header for type MSDirectoryDirectoryRoleTemplateFetcher.
*/

@protocol MSDirectoryDirectoryRoleTemplateFetcher

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSDirectoryDirectoryRoleTemplate* directoryRoleTemplate, MSODataException *error))callback;
-(NSURLSessionDataTask*) updateDirectoryRoleTemplate:(id)entity withCallback:(void (^)(MSDirectoryDirectoryRoleTemplate*, MSODataException * error))callback;
-(NSURLSessionDataTask*) deleteDirectoryRoleTemplate:(void (^)(int status, MSODataException * error))callback;
-(id<MSDirectoryDirectoryRoleTemplateFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSDirectoryDirectoryRoleTemplateFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@end

@interface MSDirectoryDirectoryRoleTemplateFetcher : MSODataEntityFetcher<MSDirectoryDirectoryRoleTemplateFetcher>

-(MSDirectoryDirectoryRoleTemplateOperations*) getOperations;

	
@end