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
@class MSODirectoryRequiredResourceAccess;
@class MSODirectoryExtensionProperty;

#import <Foundation/Foundation.h>
#import "MSODirectoryProtocols.h"
#import "MSODirectoryDirectoryObject.h"

/**
* The header for type Application.
*/

@interface MSODirectoryApplication : MSODirectoryDirectoryObject


@property NSString *appId;

@property NSMutableArray<MSODirectoryAppRole> *appRoles;

@property bool availableToOtherTenants;

@property NSString *displayName;

@property NSString *errorUrl;

@property NSString *groupMembershipClaims;

@property NSString *homepage;

@property NSMutableArray *identifierUris;

@property NSMutableArray<MSODirectoryKeyCredential> *keyCredentials;

@property NSMutableArray *knownClientApplications;

@property NSStream *mainLogo;

@property NSString *logoutUrl;

@property bool oauth2AllowImplicitFlow;

@property bool oauth2AllowUrlPathMatching;

@property NSMutableArray<MSODirectoryOAuth2Permission> *oauth2Permissions;

@property bool oauth2RequirePostResponse;

@property NSMutableArray<MSODirectoryPasswordCredential> *passwordCredentials;

@property bool publicClient;

@property NSMutableArray *replyUrls;

@property NSMutableArray<MSODirectoryRequiredResourceAccess> *requiredResourceAccess;

@property NSString *samlMetadataUrl;


@end