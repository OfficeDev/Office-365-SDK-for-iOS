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

@class MSGraphServiceAppRoleAssignmentFetcher;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceAppRoleAssignmentCollectionFetcher.
*/

@protocol MSGraphServiceAppRoleAssignmentCollectionFetcher<MSODataCollectionFetcher>

@optional
-(NSURLSessionTask*)read:(void (^)(NSArray<MSGraphServiceAppRoleAssignment> *appRoleAssignments, MSODataException *error))callback;

-(id<MSGraphServiceAppRoleAssignmentCollectionFetcher>)select : (NSString*) params;
-(id<MSGraphServiceAppRoleAssignmentCollectionFetcher>)filter : (NSString*) params;
-(id<MSGraphServiceAppRoleAssignmentCollectionFetcher>)top : (int) value;
-(id<MSGraphServiceAppRoleAssignmentCollectionFetcher>)skip : (int) value;
-(id<MSGraphServiceAppRoleAssignmentCollectionFetcher>)expand : (NSString*) value;
-(id<MSGraphServiceAppRoleAssignmentCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSGraphServiceAppRoleAssignmentCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceAppRoleAssignmentCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@required

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSGraphServiceAppRoleAssignmentFetcher*)getById:(NSString *)Id;
-(NSURLSessionTask*)addAppRoleAssignment:(MSGraphServiceAppRoleAssignment* )entity withCallback:(void (^)(MSGraphServiceAppRoleAssignment *appRoleAssignment, MSODataException *e))callback;

@end

@interface MSGraphServiceAppRoleAssignmentCollectionFetcher : MSODataCollectionFetcher<MSGraphServiceAppRoleAssignmentCollectionFetcher>

@end