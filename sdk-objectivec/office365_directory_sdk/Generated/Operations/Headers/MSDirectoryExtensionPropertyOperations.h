/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryExtensionProperty.h"
#import "MSDirectoryDirectoryObjectOperations.h"

/**
* The header for type MSDirectoryExtensionPropertyOperations.
*/


@interface MSDirectoryExtensionPropertyOperations : MSDirectoryDirectoryObjectOperations

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;

@end