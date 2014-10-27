/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSDirectoryAssignedLicense;
@class MSDirectoryAssignedPlan;
@class MSDirectoryPasswordProfile;
@class MSDirectoryProvisionedPlan;
@class MSDirectoryProvisioningError;
@class MSDirectoryAppRoleAssignment;
@class MSDirectoryOAuth2PermissionGrant;
@class MSDirectoryDirectoryObject;

#import <Foundation/Foundation.h>
#import "MSDirectoryProtocols.h"
#import "MSDirectoryDirectoryObject.h"

/**
* The header for type User.
*/

@interface MSDirectoryUser : MSDirectoryDirectoryObject
@property bool accountEnabled;
@property NSMutableArray<MSDirectoryAssignedLicense> *assignedLicenses;
@property NSMutableArray<MSDirectoryAssignedPlan> *assignedPlans;
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
@property MSDirectoryPasswordProfile *passwordProfile;
@property NSString *physicalDeliveryOfficeName;
@property NSString *postalCode;
@property NSString *preferredLanguage;
@property NSMutableArray<MSDirectoryProvisionedPlan> *provisionedPlans;
@property NSMutableArray<MSDirectoryProvisioningError> *provisioningErrors;
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