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

@class MSGraphServiceAssignedPlan;
@class MSGraphServiceProvisionedPlan;
@class MSGraphServiceProvisioningError;
@class MSGraphServiceVerifiedDomain;


#import "MSGraphServiceProtocols.h"
#import "MSGraphServiceDirectoryObject.h"
#import <Foundation/Foundation.h>


/**
* The header for type TenantDetail.
*/

@interface MSGraphServiceTenantDetail : MSGraphServiceDirectoryObject

@property NSMutableArray<MSGraphServiceAssignedPlan> *assignedPlans;
@property NSString *city;
@property NSDate *companyLastDirSyncTime;
@property NSString *country;
@property NSString *countryLetterCode;
@property BOOL dirSyncEnabled;
@property NSString *displayName;
@property NSMutableArray *marketingNotificationEmails;
@property NSString *postalCode;
@property NSString *preferredLanguage;
@property NSMutableArray<MSGraphServiceProvisionedPlan> *provisionedPlans;
@property NSMutableArray<MSGraphServiceProvisioningError> *provisioningErrors;
@property NSMutableArray *securityComplianceNotificationMails;
@property NSMutableArray *securityComplianceNotificationPhones;
@property NSString *state;
@property NSString *street;
@property NSMutableArray *technicalNotificationMails;
@property NSString *telephoneNumber;
@property NSMutableArray<MSGraphServiceVerifiedDomain> *verifiedDomains;

@end