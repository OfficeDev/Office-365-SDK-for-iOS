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
#import "MSODirectoryUserOperations.h"
#import "MSODirectoryUser.h"
@class MSODirectoryAppRoleAssignmentCollectionFetcher;
@class MSODirectoryOAuth2PermissionGrantCollectionFetcher;
@class MSODirectoryDirectoryObjectCollectionFetcher;
@class MSODirectoryDirectoryObjectCollectionFetcher;


/**
* The header for type MSODirectoryUserFetcher.
*/

@protocol MSODirectoryUserFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSODirectoryUser* user, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSODirectoryUser*, NSError * error))callback;
@end

@interface MSODirectoryUserFetcher : MSODataEntityFetcher<MSODirectoryUserFetcher>

-(MSODirectoryUserOperations*) getOperations;

-(MSODirectoryAppRoleAssignmentCollectionFetcher*) getappRoleAssignments;

-(MSODirectoryOAuth2PermissionGrantCollectionFetcher*) getoauth2PermissionGrants;

-(MSODirectoryDirectoryObjectCollectionFetcher*) getownedDevices;

-(MSODirectoryDirectoryObjectCollectionFetcher*) getregisteredDevices;

	
@end