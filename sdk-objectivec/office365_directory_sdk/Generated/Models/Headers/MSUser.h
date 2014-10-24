/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSAssignedLicense;
@class MSAssignedPlan;
@class MSPasswordProfile;
@class MSProvisionedPlan;
@class MSProvisioningError;
@class MSAppRoleAssignment;
@class MSOAuth2PermissionGrant;
@class MSDirectoryObject;

#import <Foundation/Foundation.h>
#import "MSProtocols.h"
#import "MSDirectoryObject.h"

/**
* The header for type User.
*/

@interface MSUser : MSDirectoryObject
@property bool accountEnabled;
@property NSMutableArray<MSAssignedLicense> *assignedLicenses;
@property NSMutableArray<MSAssignedPlan> *assignedPlans;
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
@property MSPasswordProfile *passwordProfile;
@property NSString *physicalDeliveryOfficeName;
@property NSString *postalCode;
@property NSString *preferredLanguage;
@property NSMutableArray<MSProvisionedPlan> *provisionedPlans;
@property NSMutableArray<MSProvisioningError> *provisioningErrors;
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