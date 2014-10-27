/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryContact.h"
#import "MSDirectoryDirectoryObjectOperations.h"
#import "MSDirectoryProvisioningError.h"

/**
* The header for type MSDirectoryContactOperations.
*/


@interface MSDirectoryContactOperations : MSDirectoryDirectoryObjectOperations

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;

@end