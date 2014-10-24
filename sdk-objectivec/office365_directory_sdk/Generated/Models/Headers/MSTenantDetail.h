/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSAssignedPlan;
@class MSProvisionedPlan;
@class MSProvisioningError;
@class MSVerifiedDomain;

#import <Foundation/Foundation.h>
#import "MSProtocols.h"
#import "MSDirectoryObject.h"

/**
* The header for type TenantDetail.
*/

@interface MSTenantDetail : MSDirectoryObject
@property NSMutableArray<MSAssignedPlan> *assignedPlans;
@property NSString *city;
@property NSDate *companyLastDirSyncTime;
@property NSString *country;
@property NSString *countryLetterCode;
@property bool dirSyncEnabled;
@property NSString *displayName;
@property NSMutableArray *marketingNotificationEmails;
@property NSString *postalCode;
@property NSString *preferredLanguage;
@property NSMutableArray<MSProvisionedPlan> *provisionedPlans;
@property NSMutableArray<MSProvisioningError> *provisioningErrors;
@property NSString *state;
@property NSString *street;
@property NSMutableArray *technicalNotificationMails;
@property NSString *telephoneNumber;
@property NSMutableArray<MSVerifiedDomain> *verifiedDomains;

@end