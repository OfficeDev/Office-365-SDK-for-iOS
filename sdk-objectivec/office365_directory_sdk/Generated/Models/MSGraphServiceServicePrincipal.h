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

@class MSGraphServiceAppRole;
@class MSGraphServiceKeyCredential;
@class MSGraphServiceOAuth2Permission;
@class MSGraphServicePasswordCredential;
@class MSGraphServiceAppRoleAssignment;
@class MSGraphServiceAppRoleAssignment;
@class MSGraphServiceOAuth2PermissionGrant;
@class MSGraphServiceDirectoryObject;
@class MSGraphServiceDirectoryObject;
@class MSGraphServiceDirectoryObject;
@class MSGraphServiceDirectoryObject;
@class MSGraphServiceDirectoryObject;


#import "MSGraphServiceProtocols.h"
#import "MSGraphServiceDirectoryObject.h"
#import <Foundation/Foundation.h>


/**
* The header for type ServicePrincipal.
*/

@interface MSGraphServiceServicePrincipal : MSGraphServiceDirectoryObject

@property BOOL accountEnabled;
@property NSString *appDisplayName;
@property NSString *appId;
@property NSString *appOwnerTenantId;
@property BOOL appRoleAssignmentRequired;
@property NSMutableArray<MSGraphServiceAppRole> *appRoles;
@property NSString *displayName;
@property NSString *errorUrl;
@property NSString *homepage;
@property NSMutableArray<MSGraphServiceKeyCredential> *keyCredentials;
@property NSString *logoutUrl;
@property NSMutableArray<MSGraphServiceOAuth2Permission> *oauth2Permissions;
@property NSMutableArray<MSGraphServicePasswordCredential> *passwordCredentials;
@property NSString *preferredTokenSigningKeyThumbprint;
@property NSString *publisherName;
@property NSMutableArray *replyUrls;
@property NSString *samlMetadataUrl;
@property NSMutableArray *servicePrincipalNames;
@property NSMutableArray *tags;
@property MSGraphServiceAppRoleAssignment *appRoleAssignedTo;
@property NSMutableArray<MSGraphServiceAppRoleAssignment> *appRoleAssignments;
@property NSMutableArray<MSGraphServiceOAuth2PermissionGrant> *oauth2PermissionGrants;
@property NSMutableArray<MSGraphServiceDirectoryObject> *memberOf;
@property MSGraphServiceDirectoryObject *createdOnBehalfOf;
@property NSMutableArray<MSGraphServiceDirectoryObject> *createdObjects;
@property NSMutableArray<MSGraphServiceDirectoryObject> *owners;
@property NSMutableArray<MSGraphServiceDirectoryObject> *ownedObjects;

@end