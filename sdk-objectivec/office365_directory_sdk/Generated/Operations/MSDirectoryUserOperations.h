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
#import "MSDirectoryUser.h"
#import "MSDirectoryDirectoryObjectOperations.h"

#import "MSDirectoryAssignedLicense.h"
#import "MSDirectoryAssignedPlan.h"
#import "MSDirectoryPasswordProfile.h"
#import "MSDirectoryProvisionedPlan.h"
#import "MSDirectoryProvisioningError.h"
#import "MSDirectoryAppRoleAssignment.h"
#import "MSDirectoryOAuth2PermissionGrant.h"
#import "MSDirectoryDirectoryObject.h"

/**
* The header for type MSDirectoryUserOperations.
*/

@interface MSDirectoryUserOperations : MSDirectoryDirectoryObjectOperations

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;

-(NSURLSessionDataTask*)assignLicense : (NSMutableArray<MSDirectoryAssignedLicense> *) addLicenses : (NSMutableArray *) removeLicenses : (void (^)(MSDirectoryUser *user, MSODataException *error))callback;			

@end