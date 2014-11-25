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

@class MSODirectoryAssignedLicense;
@class MSODirectoryAssignedPlan;
@class MSODirectoryPasswordProfile;
@class MSODirectoryProvisionedPlan;
@class MSODirectoryProvisioningError;
@class MSODirectoryAppRoleAssignment;
@class MSODirectoryOAuth2PermissionGrant;
@class MSODirectoryDirectoryObject;

#import <Foundation/Foundation.h>
#import "MSODirectoryProtocols.h"
#import "MSODirectoryDirectoryObject.h"

/**
* The header for type User.
*/

@interface MSODirectoryUser : MSODirectoryDirectoryObject


@property bool accountEnabled;

@property NSMutableArray<MSODirectoryAssignedLicense> *assignedLicenses;

@property NSMutableArray<MSODirectoryAssignedPlan> *assignedPlans;

@property NSString *city;

@property NSString *country;

@property NSString *department;

@property bool dirSyncEnabled;

@property NSString *displayName;

@property NSString *facsimileTelephoneNumber;

@property NSString *givenName;

@property NSString *immutableId;

@property NSString *jobTitle;

@property NSDate *lastDirSyncTime;

@property NSString *mail;

@property NSString *mailNickname;

@property NSString *mobile;

@property NSString *onPremisesSecurityIdentifier;

@property NSMutableArray *otherMails;

@property NSString *passwordPolicies;

@property MSODirectoryPasswordProfile *passwordProfile;

@property NSString *physicalDeliveryOfficeName;

@property NSString *postalCode;

@property NSString *preferredLanguage;

@property NSMutableArray<MSODirectoryProvisionedPlan> *provisionedPlans;

@property NSMutableArray<MSODirectoryProvisioningError> *provisioningErrors;

@property NSMutableArray *proxyAddresses;

@property NSString *sipProxyAddress;

@property NSString *state;

@property NSString *streetAddress;

@property NSString *surname;

@property NSString *telephoneNumber;

@property NSStream *thumbnailPhoto;

@property NSString *usageLocation;

@property NSString *userPrincipalName;

@property NSString *userType;


@end