/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryDirectoryRoleTemplate.h"
#import "MSDirectoryDirectoryObjectOperations.h"

/**
* The header for type MSDirectoryDirectoryRoleTemplateOperations.
*/


@interface MSDirectoryDirectoryRoleTemplateOperations : MSDirectoryDirectoryObjectOperations

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;

@end