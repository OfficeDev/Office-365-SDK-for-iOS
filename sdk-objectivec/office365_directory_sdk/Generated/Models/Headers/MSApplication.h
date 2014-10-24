/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSAppRole;
@class MSKeyCredential;
@class MSOAuth2Permission;
@class MSPasswordCredential;
@class MSRequiredResourceAccess;
@class MSExtensionProperty;

#import <Foundation/Foundation.h>
#import "MSProtocols.h"
#import "MSDirectoryObject.h"

/**
* The header for type Application.
*/

@interface MSApplication : MSDirectoryObject
@property NSString *appId;
@property NSMutableArray<MSAppRole> *appRoles;
@property bool availableToOtherTenants;
@property NSString *displayName;
@property NSString *errorUrl;
@property NSString *groupMembershipClaims;
@property NSString *homepage;
@property NSMutableArray *identifierUris;
@property NSMutableArray<MSKeyCredential> *keyCredentials;
@property NSMutableArray *knownClientApplications;
@property NSStream *mainLogo;
@property NSString *logoutUrl;
@property bool oauth2AllowImplicitFlow;
@property bool oauth2AllowUrlPathMatching;
@property NSMutableArray<MSOAuth2Permission> *oauth2Permissions;
@property bool oauth2RequirePostResponse;
@property NSMutableArray<MSPasswordCredential> *passwordCredentials;
@property bool publicClient;
@property NSMutableArray *replyUrls;
@property NSMutableArray<MSRequiredResourceAccess> *requiredResourceAccess;
@property NSString *samlMetadataUrl;

@end