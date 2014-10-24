/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSContact.h"
#import "MSDirectoryObjectOperations.h"
#import "MSProvisioningError.h"

/**
* The header for type MSContactOperations.
*/


@interface MSContactOperations : MSDirectoryObjectOperations

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

@end