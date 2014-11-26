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
#import "MSDirectoryUserOperations.h"
#import "MSDirectoryUser.h"
@class MSDirectoryAppRoleAssignmentCollectionFetcher;
@class MSDirectoryOAuth2PermissionGrantCollectionFetcher;
@class MSDirectoryDirectoryObjectCollectionFetcher;
@class MSDirectoryDirectoryObjectCollectionFetcher;


/**
* The header for type MSDirectoryUserFetcher.
*/

@protocol MSDirectoryUserFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSDirectoryUser* user, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSDirectoryUser*, NSError * error))callback;
@end

@interface MSDirectoryUserFetcher : MSODataEntityFetcher<MSDirectoryUserFetcher>

-(MSDirectoryUserOperations*) getOperations;

-(MSDirectoryAppRoleAssignmentCollectionFetcher*) getappRoleAssignments;

-(MSDirectoryOAuth2PermissionGrantCollectionFetcher*) getoauth2PermissionGrants;

-(MSDirectoryDirectoryObjectCollectionFetcher*) getownedDevices;

-(MSDirectoryDirectoryObjectCollectionFetcher*) getregisteredDevices;

	
@end