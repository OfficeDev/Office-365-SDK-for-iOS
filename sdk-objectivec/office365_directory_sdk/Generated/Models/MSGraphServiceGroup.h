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

@class MSGraphServiceProvisioningError;
@class MSGraphServiceAppRoleAssignment;
@class MSGraphServiceDirectoryObject;
@class MSGraphServiceDirectoryObject;
@class MSGraphServiceDirectoryObject;
@class MSGraphServiceDirectoryObject;


#import "MSGraphServiceProtocols.h"
#import "MSGraphServiceDirectoryObject.h"
#import <Foundation/Foundation.h>


/**
* The header for type Group.
*/

@interface MSGraphServiceGroup : MSGraphServiceDirectoryObject

@property NSString *$$__description;
@property BOOL dirSyncEnabled;
@property NSString *displayName;
@property NSDate *lastDirSyncTime;
@property NSString *mail;
@property NSString *mailNickname;
@property BOOL mailEnabled;
@property NSString *onPremisesSecurityIdentifier;
@property NSMutableArray<MSGraphServiceProvisioningError> *provisioningErrors;
@property NSMutableArray *proxyAddresses;
@property BOOL securityEnabled;
@property NSMutableArray<MSGraphServiceAppRoleAssignment> *appRoleAssignments;
@property NSMutableArray<MSGraphServiceDirectoryObject> *members;
@property NSMutableArray<MSGraphServiceDirectoryObject> *memberOf;
@property MSGraphServiceDirectoryObject *createdOnBehalfOf;
@property NSMutableArray<MSGraphServiceDirectoryObject> *owners;

@end