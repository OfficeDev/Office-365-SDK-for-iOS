/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSUser.h"
#import "MSDirectoryObjectOperations.h"
#import "MSAssignedLicense.h"
#import "MSAssignedPlan.h"
#import "MSPasswordProfile.h"
#import "MSProvisionedPlan.h"
#import "MSProvisioningError.h"
#import "MSAppRoleAssignment.h"
#import "MSOAuth2PermissionGrant.h"
#import "MSDirectoryObject.h"

/**
* The header for type MSUserOperations.
*/


@interface MSUserOperations : MSDirectoryObjectOperations

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;
-(NSURLSessionDataTask*)assignLicense : (NSMutableArray<MSAssignedLicense> *) addLicenses : (NSMutableArray *) removeLicenses : (void (^)(MSUser *user, NSError *error))callback;			

@end