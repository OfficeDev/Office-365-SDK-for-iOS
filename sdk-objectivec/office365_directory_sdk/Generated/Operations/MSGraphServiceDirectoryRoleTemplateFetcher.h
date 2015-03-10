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

@class MSGraphServiceDirectoryRoleTemplateOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceDirectoryRoleTemplateFetcher.
*/


@protocol MSGraphServiceDirectoryRoleTemplateFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSGraphServiceDirectoryRoleTemplate* directoryRoleTemplate, MSODataException *error))callback;
-(NSURLSessionTask*) updateDirectoryRoleTemplate:(id)entity withCallback:(void (^)(MSGraphServiceDirectoryRoleTemplate*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteDirectoryRoleTemplate:(void (^)(int status, MSODataException * error))callback;
-(id<MSGraphServiceDirectoryRoleTemplateFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceDirectoryRoleTemplateFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSGraphServiceDirectoryRoleTemplateFetcher>)select : (NSString*) params;
-(id<MSGraphServiceDirectoryRoleTemplateFetcher>)expand : (NSString*) value;

@required
-(MSGraphServiceDirectoryRoleTemplateOperations*) getOperations;
@end

@interface MSGraphServiceDirectoryRoleTemplateFetcher : MSODataEntityFetcher<MSGraphServiceDirectoryRoleTemplateFetcher>

@end