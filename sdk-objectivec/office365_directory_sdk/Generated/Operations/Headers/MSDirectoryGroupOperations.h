/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryGroup.h"
#import "MSDirectoryDirectoryObjectOperations.h"
#import "MSDirectoryProvisioningError.h"
#import "MSDirectoryAppRoleAssignment.h"

/**
* The header for type MSDirectoryGroupOperations.
*/


@interface MSDirectoryGroupOperations : MSDirectoryDirectoryObjectOperations

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;

@end