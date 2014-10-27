/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

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

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;
-(NSURLSessionDataTask*)assignLicense : (NSMutableArray<MSDirectoryAssignedLicense> *) addLicenses : (NSMutableArray *) removeLicenses : (void (^)(MSDirectoryUser *user, NSError *error))callback;			

@end