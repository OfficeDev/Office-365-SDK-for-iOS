/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSAppRole;
@class MSKeyCredential;
@class MSOAuth2Permission;
@class MSPasswordCredential;
@class MSAppRoleAssignment;
@class MSOAuth2PermissionGrant;

#import <Foundation/Foundation.h>
#import "MSProtocols.h"
#import "MSDirectoryObject.h"

/**
* The header for type ServicePrincipal.
*/

@interface MSServicePrincipal : MSDirectoryObject
@property bool accountEnabled;
@property NSString *appDisplayName;
@property NSString *appId;
@property NSString *appOwnerTenantId;
@property bool appRoleAssignmentRequired;
@property NSMutableArray<MSAppRole> *appRoles;
@property NSString *displayName;
@property NSString *errorUrl;
@property NSString *homepage;
@property NSMutableArray<MSKeyCredential> *keyCredentials;
@property NSString *logoutUrl;
@property NSMutableArray<MSOAuth2Permission> *oauth2Permissions;
@property NSMutableArray<MSPasswordCredential> *passwordCredentials;
@property NSString *preferredTokenSigningKeyThumbprint;
@property NSString *publisherName;
@property NSMutableArray *replyUrls;
@property NSString *samlMetadataUrl;
@property NSMutableArray *servicePrincipalNames;
@property NSMutableArray *tags;

@end