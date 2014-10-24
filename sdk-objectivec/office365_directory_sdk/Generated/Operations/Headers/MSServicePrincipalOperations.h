/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSServicePrincipal.h"
#import "MSDirectoryObjectOperations.h"
#import "MSAppRole.h"
#import "MSKeyCredential.h"
#import "MSOAuth2Permission.h"
#import "MSPasswordCredential.h"
#import "MSAppRoleAssignment.h"
#import "MSOAuth2PermissionGrant.h"

/**
* The header for type MSServicePrincipalOperations.
*/


@interface MSServicePrincipalOperations : MSDirectoryObjectOperations

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

@end