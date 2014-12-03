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
#import "MSDirectoryServicePrincipalOperations.h"
#import "MSDirectoryServicePrincipal.h"
@class MSDirectoryAppRoleAssignmentCollectionFetcher;
@class MSDirectoryAppRoleAssignmentCollectionFetcher;
@class MSDirectoryOAuth2PermissionGrantCollectionFetcher;
@class MSDirectoryAppRoleAssignmentFetcher;
@class MSDirectoryAppRoleAssignmentFetcher;
@class MSDirectoryOAuth2PermissionGrantFetcher;

/**
* The header for type MSDirectoryServicePrincipalFetcher.
*/

@protocol MSDirectoryServicePrincipalFetcher

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSDirectoryServicePrincipal* servicePrincipal, MSODataException *error))callback;
-(NSURLSessionDataTask*) updateServicePrincipal:(id)entity withCallback:(void (^)(MSDirectoryServicePrincipal*, MSODataException * error))callback;
-(NSURLSessionDataTask*) deleteServicePrincipal:(void (^)(int status, MSODataException * error))callback;
-(id<MSDirectoryServicePrincipalFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSDirectoryServicePrincipalFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSDirectoryServicePrincipalFetcher>)select : (NSString*) params;
-(id<MSDirectoryServicePrincipalFetcher>)expand : (NSString*) value;
@end

@interface MSDirectoryServicePrincipalFetcher : MSODataEntityFetcher<MSDirectoryServicePrincipalFetcher>

-(MSDirectoryServicePrincipalOperations*) getOperations;

-(MSDirectoryAppRoleAssignmentCollectionFetcher*) getappRoleAssignedTo;

-(MSDirectoryAppRoleAssignmentFetcher*) getappRoleAssignedToById : (NSString*)_id;

-(MSDirectoryAppRoleAssignmentCollectionFetcher*) getappRoleAssignments;

-(MSDirectoryAppRoleAssignmentFetcher*) getappRoleAssignmentsById : (NSString*)_id;

-(MSDirectoryOAuth2PermissionGrantCollectionFetcher*) getoauth2PermissionGrants;

-(MSDirectoryOAuth2PermissionGrantFetcher*) getoauth2PermissionGrantsById : (NSString*)_id;

	
@end