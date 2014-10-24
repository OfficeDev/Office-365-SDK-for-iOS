/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSGroup.h"
#import "MSDirectoryObjectOperations.h"
#import "MSProvisioningError.h"
#import "MSAppRoleAssignment.h"

/**
* The header for type MSGroupOperations.
*/


@interface MSGroupOperations : MSDirectoryObjectOperations

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

@end