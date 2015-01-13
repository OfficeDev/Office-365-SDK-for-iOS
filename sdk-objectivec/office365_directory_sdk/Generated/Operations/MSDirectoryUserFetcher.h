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
#import "MSDirectoryDirectoryObjectFetcher.h"
#import "MSDirectoryDirectoryObjectFetcher.h"
#import "MSDirectoryUser.h"
@class MSDirectoryAppRoleAssignmentCollectionFetcher;
@class MSDirectoryOAuth2PermissionGrantCollectionFetcher;
@class MSDirectoryDirectoryObjectCollectionFetcher;
@class MSDirectoryDirectoryObjectCollectionFetcher;
@class MSDirectoryAppRoleAssignmentFetcher;
@class MSDirectoryAppRoleAssignmentFetcher;
@class MSDirectoryOAuth2PermissionGrantFetcher;
@class MSDirectoryAppRoleAssignmentFetcher;
/**
* The header for type MSDirectoryUserFetcher.
*/

@protocol MSDirectoryUserFetcher

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSDirectoryUser* user, MSODataException *error))callback;
-(NSURLSessionDataTask*) updateUser:(id)entity withCallback:(void (^)(MSDirectoryUser*, MSODataException * error))callback;
-(NSURLSessionDataTask*) deleteUser:(void (^)(int status, MSODataException * error))callback;
-(id<MSDirectoryUserFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSDirectoryUserFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSDirectoryUserFetcher>)select : (NSString*) params;
-(id<MSDirectoryUserFetcher>)expand : (NSString*) value;
@end

@interface MSDirectoryUserFetcher : MSODataEntityFetcher<MSDirectoryUserFetcher>

-(MSDirectoryUserOperations*) getOperations;

-(MSDirectoryAppRoleAssignmentCollectionFetcher*) getappRoleAssignments;

-(MSDirectoryAppRoleAssignmentFetcher*) getappRoleAssignmentsById : (NSString*)_id;

-(MSDirectoryOAuth2PermissionGrantCollectionFetcher*) getoauth2PermissionGrants;

-(MSDirectoryOAuth2PermissionGrantFetcher*) getoauth2PermissionGrantsById : (NSString*)_id;

-(MSDirectoryDirectoryObjectCollectionFetcher*) getownedDevices;

-(MSDirectoryDirectoryObjectFetcher*) getownedDevicesById : (NSString*)_id;

-(MSDirectoryDirectoryObjectCollectionFetcher*) getregisteredDevices;

-(MSDirectoryDirectoryObjectFetcher*) getregisteredDevicesById : (NSString*)_id;

	
@end