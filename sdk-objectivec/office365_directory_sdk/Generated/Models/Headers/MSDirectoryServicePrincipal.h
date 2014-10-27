/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSDirectoryAppRole;
@class MSDirectoryKeyCredential;
@class MSDirectoryOAuth2Permission;
@class MSDirectoryPasswordCredential;
@class MSDirectoryAppRoleAssignment;
@class MSDirectoryOAuth2PermissionGrant;

#import <Foundation/Foundation.h>
#import "MSDirectoryProtocols.h"
#import "MSDirectoryDirectoryObject.h"

/**
* The header for type ServicePrincipal.
*/

@interface MSDirectoryServicePrincipal : MSDirectoryDirectoryObject
@property bool accountEnabled;
@property NSString *appDisplayName;
@property NSString *appId;
@property NSString *appOwnerTenantId;
@property bool appRoleAssignmentRequired;
@property NSMutableArray<MSDirectoryAppRole> *appRoles;
@property NSString *displayName;
@property NSString *errorUrl;
@property NSString *homepage;
@property NSMutableArray<MSDirectoryKeyCredential> *keyCredentials;
@property NSString *logoutUrl;
@property NSMutableArray<MSDirectoryOAuth2Permission> *oauth2Permissions;
@property NSMutableArray<MSDirectoryPasswordCredential> *passwordCredentials;
@property NSString *preferredTokenSigningKeyThumbprint;
@property NSString *publisherName;
@property NSMutableArray *replyUrls;
@property NSString *samlMetadataUrl;
@property NSMutableArray *servicePrincipalNames;
@property NSMutableArray *tags;

@end