/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryTenantDetail.h"
#import "MSDirectoryDirectoryObjectOperations.h"
#import "MSDirectoryAssignedPlan.h"
#import "MSDirectoryProvisionedPlan.h"
#import "MSDirectoryProvisioningError.h"
#import "MSDirectoryVerifiedDomain.h"

/**
* The header for type MSDirectoryTenantDetailOperations.
*/


@interface MSDirectoryTenantDetailOperations : MSDirectoryDirectoryObjectOperations

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;

@end