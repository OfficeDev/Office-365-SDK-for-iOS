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
@class MSGraphServiceOAuth2PermissionGrantFetcher;;
@class MSGraphServiceOAuth2PermissionGrantCollectionFetcher;;
@class MSGraphServiceDirectoryObjectFetcher;;
@class MSGraphServiceDirectoryObjectCollectionFetcher;;
@class MSGraphServiceServicePrincipalOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceServicePrincipalFetcher.
*/


@protocol MSGraphServiceServicePrincipalFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSGraphServiceServicePrincipal* servicePrincipal, MSODataException *error))callback;
-(NSURLSessionTask*) updateServicePrincipal:(id)entity withCallback:(void (^)(MSGraphServiceServicePrincipal*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteServicePrincipal:(void (^)(int status, MSODataException * error))callback;
-(id<MSGraphServiceServicePrincipalFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceServicePrincipalFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSGraphServiceServicePrincipalFetcher>)select : (NSString*) params;
-(id<MSGraphServiceServicePrincipalFetcher>)expand : (NSString*) value;

@required
-(MSGraphServiceServicePrincipalOperations*) getOperations;
-(MSGraphServiceAppRoleAssignmentFetcher*) getappRoleAssignedTo;
-(MSGraphServiceAppRoleAssignmentCollectionFetcher*) getappRoleAssignments;

-(MSGraphServiceAppRoleAssignmentFetcher*) getappRoleAssignmentsById : (NSString*)_id;
-(MSGraphServiceOAuth2PermissionGrantCollectionFetcher*) getoauth2PermissionGrants;

-(MSGraphServiceOAuth2PermissionGrantFetcher*) getoauth2PermissionGrantsById : (NSString*)_id;
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getmemberOf;

-(MSGraphServiceDirectoryObjectFetcher*) getmemberOfById : (NSString*)_id;
-(MSGraphServiceDirectoryObjectFetcher*) getcreatedOnBehalfOf;
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getcreatedObjects;

-(MSGraphServiceDirectoryObjectFetcher*) getcreatedObjectsById : (NSString*)_id;
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getowners;

-(MSGraphServiceDirectoryObjectFetcher*) getownersById : (NSString*)_id;
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getownedObjects;

-(MSGraphServiceDirectoryObjectFetcher*) getownedObjectsById : (NSString*)_id;
@end

@interface MSGraphServiceServicePrincipalFetcher : MSODataEntityFetcher<MSGraphServiceServicePrincipalFetcher>

@end