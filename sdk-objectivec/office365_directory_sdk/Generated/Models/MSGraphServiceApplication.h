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
@class NSStream;
@class MSGraphServiceOAuth2Permission;
@class MSGraphServicePasswordCredential;
@class MSGraphServiceRequiredResourceAccess;
@class MSGraphServiceExtensionProperty;
@class MSGraphServiceDirectoryObject;
@class MSGraphServiceDirectoryObject;


#import "MSGraphServiceProtocols.h"
#import "MSGraphServiceDirectoryObject.h"
#import <Foundation/Foundation.h>


/**
* The header for type Application.
*/

@interface MSGraphServiceApplication : MSGraphServiceDirectoryObject

@property NSString *appId;
@property NSMutableArray<MSGraphServiceAppRole> *appRoles;
@property BOOL availableToOtherTenants;
@property NSString *displayName;
@property NSString *errorUrl;
@property NSString *groupMembershipClaims;
@property NSString *homepage;
@property NSMutableArray *identifierUris;
@property NSMutableArray<MSGraphServiceKeyCredential> *keyCredentials;
@property NSMutableArray *knownClientApplications;
@property NSStream *mainLogo;
@property NSString *logoutUrl;
@property BOOL oauth2AllowImplicitFlow;
@property BOOL oauth2AllowUrlPathMatching;
@property NSMutableArray<MSGraphServiceOAuth2Permission> *oauth2Permissions;
@property BOOL oauth2RequirePostResponse;
@property NSMutableArray<MSGraphServicePasswordCredential> *passwordCredentials;
@property BOOL publicClient;
@property NSMutableArray *replyUrls;
@property NSMutableArray<MSGraphServiceRequiredResourceAccess> *requiredResourceAccess;
@property NSString *samlMetadataUrl;
@property NSMutableArray<MSGraphServiceExtensionProperty> *extensionProperties;
@property MSGraphServiceDirectoryObject *createdOnBehalfOf;
@property NSMutableArray<MSGraphServiceDirectoryObject> *owners;

@end