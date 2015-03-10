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

@class MSGraphServiceAppRoleAssignmentOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceAppRoleAssignmentFetcher.
*/


@protocol MSGraphServiceAppRoleAssignmentFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSGraphServiceAppRoleAssignment* appRoleAssignment, MSODataException *error))callback;
-(NSURLSessionTask*) updateAppRoleAssignment:(id)entity withCallback:(void (^)(MSGraphServiceAppRoleAssignment*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteAppRoleAssignment:(void (^)(int status, MSODataException * error))callback;
-(id<MSGraphServiceAppRoleAssignmentFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceAppRoleAssignmentFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSGraphServiceAppRoleAssignmentFetcher>)select : (NSString*) params;
-(id<MSGraphServiceAppRoleAssignmentFetcher>)expand : (NSString*) value;

@required
-(MSGraphServiceAppRoleAssignmentOperations*) getOperations;
@end

@interface MSGraphServiceAppRoleAssignmentFetcher : MSODataEntityFetcher<MSGraphServiceAppRoleAssignmentFetcher>

@end