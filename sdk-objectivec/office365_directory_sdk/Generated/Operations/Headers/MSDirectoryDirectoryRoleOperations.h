/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryDirectoryRole.h"
#import "MSDirectoryDirectoryObjectOperations.h"

/**
* The header for type MSDirectoryDirectoryRoleOperations.
*/


@interface MSDirectoryDirectoryRoleOperations : MSDirectoryDirectoryObjectOperations

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;

@end