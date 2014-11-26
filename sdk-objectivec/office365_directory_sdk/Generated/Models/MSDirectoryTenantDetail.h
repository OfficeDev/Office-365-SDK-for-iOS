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