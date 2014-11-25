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

@class MSODirectoryAppRole;
@class MSODirectoryKeyCredential;
@class MSODirectoryOAuth2Permission;
@class MSODirectoryPasswordCredential;
@class MSODirectoryAppRoleAssignment;
@class MSODirectoryOAuth2PermissionGrant;

#import <Foundation/Foundation.h>
#import "MSODirectoryProtocols.h"
#import "MSODirectoryDirectoryObject.h"

/**
* The header for type ServicePrincipal.
*/

@interface MSODirectoryServicePrincipal : MSODirectoryDirectoryObject


@property bool accountEnabled;

@property NSString *appDisplayName;

@property NSString *appId;

@property NSString *appOwnerTenantId;

@property bool appRoleAssignmentRequired;

@property NSMutableArray<MSODirectoryAppRole> *appRoles;

@property NSString *displayName;

@property NSString *errorUrl;

@property NSString *homepage;

@property NSMutableArray<MSODirectoryKeyCredential> *keyCredentials;

@property NSString *logoutUrl;

@property NSMutableArray<MSODirectoryOAuth2Permission> *oauth2Permissions;

@property NSMutableArray<MSODirectoryPasswordCredential> *passwordCredentials;

@property NSString *preferredTokenSigningKeyThumbprint;

@property NSString *publisherName;

@property NSMutableArray *replyUrls;

@property NSString *samlMetadataUrl;

@property NSMutableArray *servicePrincipalNames;

@property NSMutableArray *tags;


@end