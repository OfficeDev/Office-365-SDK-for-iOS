/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSTenantDetail.h"
#import "MSDirectoryObjectOperations.h"
#import "MSAssignedPlan.h"
#import "MSProvisionedPlan.h"
#import "MSProvisioningError.h"
#import "MSVerifiedDomain.h"

/**
* The header for type MSTenantDetailOperations.
*/


@interface MSTenantDetailOperations : MSDirectoryObjectOperations

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

@end