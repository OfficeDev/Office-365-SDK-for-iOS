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
#import "MSDirectoryAppRoleAssignmentOperations.h"
#import "MSDirectoryAppRoleAssignment.h"


/**
* The header for type MSDirectoryAppRoleAssignmentFetcher.
*/

@protocol MSDirectoryAppRoleAssignmentFetcher

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSDirectoryAppRoleAssignment* appRoleAssignment, MSODataException *error))callback;
-(NSURLSessionDataTask*) updateAppRoleAssignment:(id)entity withCallback:(void (^)(MSDirectoryAppRoleAssignment*, MSODataException * error))callback;
-(NSURLSessionDataTask*) deleteAppRoleAssignment:(void (^)(int status, MSODataException * error))callback;
-(id<MSDirectoryAppRoleAssignmentFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSDirectoryAppRoleAssignmentFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@end

@interface MSDirectoryAppRoleAssignmentFetcher : MSODataEntityFetcher<MSDirectoryAppRoleAssignmentFetcher>

-(MSDirectoryAppRoleAssignmentOperations*) getOperations;

	
@end