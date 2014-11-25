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

#import <office365_odata_base/office365_odata_base.h>
#import "MSODirectoryUser.h"
#import "MSODirectoryDirectoryObjectOperations.h"

#import "MSODirectoryAssignedLicense.h"
#import "MSODirectoryAssignedPlan.h"
#import "MSODirectoryPasswordProfile.h"
#import "MSODirectoryProvisionedPlan.h"
#import "MSODirectoryProvisioningError.h"
#import "MSODirectoryAppRoleAssignment.h"
#import "MSODirectoryOAuth2PermissionGrant.h"
#import "MSODirectoryDirectoryObject.h"

/**
* The header for type MSODirectoryUserOperations.
*/

@interface MSODirectoryUserOperations : MSODirectoryDirectoryObjectOperations

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)assignLicense : (NSMutableArray<MSODirectoryAssignedLicense> *) addLicenses : (NSMutableArray *) removeLicenses : (void (^)(MSODirectoryUser *user, NSError *error))callback;			

@end