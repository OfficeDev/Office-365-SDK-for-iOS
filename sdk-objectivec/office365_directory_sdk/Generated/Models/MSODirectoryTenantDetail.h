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

@class MSODirectoryAssignedPlan;
@class MSODirectoryProvisionedPlan;
@class MSODirectoryProvisioningError;
@class MSODirectoryVerifiedDomain;

#import <Foundation/Foundation.h>
#import "MSODirectoryProtocols.h"
#import "MSODirectoryDirectoryObject.h"

/**
* The header for type TenantDetail.
*/

@interface MSODirectoryTenantDetail : MSODirectoryDirectoryObject


@property NSMutableArray<MSODirectoryAssignedPlan> *assignedPlans;

@property NSString *city;

@property NSDate *companyLastDirSyncTime;

@property NSString *country;

@property NSString *countryLetterCode;

@property bool dirSyncEnabled;

@property NSString *displayName;

@property NSMutableArray *marketingNotificationEmails;

@property NSString *postalCode;

@property NSString *preferredLanguage;

@property NSMutableArray<MSODirectoryProvisionedPlan> *provisionedPlans;

@property NSMutableArray<MSODirectoryProvisioningError> *provisioningErrors;

@property NSString *state;

@property NSString *street;

@property NSMutableArray *technicalNotificationMails;

@property NSString *telephoneNumber;

@property NSMutableArray<MSODirectoryVerifiedDomain> *verifiedDomains;


@end