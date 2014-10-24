/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOAuth2PermissionGrant.h"
#import "MSODataOperations.h"

/**
* The header for type MSOAuth2PermissionGrantOperations.
*/


@interface MSOAuth2PermissionGrantOperations : MSODataOperations

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

@end