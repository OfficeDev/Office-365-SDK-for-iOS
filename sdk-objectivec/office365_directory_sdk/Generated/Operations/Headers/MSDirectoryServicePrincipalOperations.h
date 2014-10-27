/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryServicePrincipal.h"
#import "MSDirectoryDirectoryObjectOperations.h"
#import "MSDirectoryAppRole.h"
#import "MSDirectoryKeyCredential.h"
#import "MSDirectoryOAuth2Permission.h"
#import "MSDirectoryPasswordCredential.h"
#import "MSDirectoryAppRoleAssignment.h"
#import "MSDirectoryOAuth2PermissionGrant.h"

/**
* The header for type MSDirectoryServicePrincipalOperations.
*/


@interface MSDirectoryServicePrincipalOperations : MSDirectoryDirectoryObjectOperations

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;

@end