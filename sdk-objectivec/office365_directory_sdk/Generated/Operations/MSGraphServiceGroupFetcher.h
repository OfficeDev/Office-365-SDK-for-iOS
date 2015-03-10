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

@class MSGraphServiceAppRoleAssignmentFetcher;;
@class MSGraphServiceAppRoleAssignmentCollectionFetcher;;
@class MSGraphServiceDirectoryObjectFetcher;;
@class MSGraphServiceDirectoryObjectCollectionFetcher;;
@class MSGraphServiceGroupOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceGroupFetcher.
*/


@protocol MSGraphServiceGroupFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSGraphServiceGroup* group, MSODataException *error))callback;
-(NSURLSessionTask*) updateGroup:(id)entity withCallback:(void (^)(MSGraphServiceGroup*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteGroup:(void (^)(int status, MSODataException * error))callback;
-(id<MSGraphServiceGroupFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceGroupFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSGraphServiceGroupFetcher>)select : (NSString*) params;
-(id<MSGraphServiceGroupFetcher>)expand : (NSString*) value;

@required
-(MSGraphServiceGroupOperations*) getOperations;
-(MSGraphServiceAppRoleAssignmentCollectionFetcher*) getappRoleAssignments;

-(MSGraphServiceAppRoleAssignmentFetcher*) getappRoleAssignmentsById : (NSString*)_id;
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getmembers;

-(MSGraphServiceDirectoryObjectFetcher*) getmembersById : (NSString*)_id;
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getmemberOf;

-(MSGraphServiceDirectoryObjectFetcher*) getmemberOfById : (NSString*)_id;
-(MSGraphServiceDirectoryObjectFetcher*) getcreatedOnBehalfOf;
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getowners;

-(MSGraphServiceDirectoryObjectFetcher*) getownersById : (NSString*)_id;
@end

@interface MSGraphServiceGroupFetcher : MSODataEntityFetcher<MSGraphServiceGroupFetcher>

@end