/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 *
 * Warning: This code was generated automatically. Edits will be overwritten.
 * To make changes to this code, please make changes to the generation framework itself:
 * https://github.com/MSOpenTech/odata-codegen
 *******************************************************************************/

#import <office365_odata_base/office365_odata_base.h>
#import "MSODirectoryServicePrincipal.h"
#import "MSODirectoryDirectoryObjectOperations.h"

#import "MSODirectoryAppRole.h"
#import "MSODirectoryKeyCredential.h"
#import "MSODirectoryOAuth2Permission.h"
#import "MSODirectoryPasswordCredential.h"
#import "MSODirectoryAppRoleAssignment.h"
#import "MSODirectoryOAuth2PermissionGrant.h"

/**
* The header for type MSODirectoryServicePrincipalOperations.
*/

@interface MSODirectoryServicePrincipalOperations : MSODirectoryDirectoryObjectOperations

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

@end