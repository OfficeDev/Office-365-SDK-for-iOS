/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryAppRoleAssignment.h"
#import "MSDirectoryDirectoryObjectOperations.h"

/**
* The header for type MSDirectoryAppRoleAssignmentOperations.
*/


@interface MSDirectoryAppRoleAssignmentOperations : MSDirectoryDirectoryObjectOperations

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;

@end