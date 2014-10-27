/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSDirectoryAssignedPlan;
@class MSDirectoryProvisionedPlan;
@class MSDirectoryProvisioningError;
@class MSDirectoryVerifiedDomain;

#import <Foundation/Foundation.h>
#import "MSDirectoryProtocols.h"
#import "MSDirectoryDirectoryObject.h"

/**
* The header for type TenantDetail.
*/

@interface MSDirectoryTenantDetail : MSDirectoryDirectoryObject
@property NSMutableArray<MSDirectoryAssignedPlan> *assignedPlans;
@property NSString *city;
@property NSDate *companyLastDirSyncTime;
@property NSString *country;
@property NSString *countryLetterCode;
@property bool dirSyncEnabled;
@property NSString *displayName;
@property NSMutableArray *marketingNotificationEmails;
@property NSString *postalCode;
@property NSString *preferredLanguage;
@property NSMutableArray<MSDirectoryProvisionedPlan> *provisionedPlans;
@property NSMutableArray<MSDirectoryProvisioningError> *provisioningErrors;
@property NSString *state;
@property NSString *street;
@property NSMutableArray *technicalNotificationMails;
@property NSString *telephoneNumber;
@property NSMutableArray<MSDirectoryVerifiedDomain> *verifiedDomains;

@end