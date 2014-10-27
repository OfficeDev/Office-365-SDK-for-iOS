/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryOAuth2PermissionGrant.h"
#import "MSDirectoryODataOperations.h"

/**
* The header for type MSDirectoryOAuth2PermissionGrantOperations.
*/


@interface MSDirectoryOAuth2PermissionGrantOperations : MSDirectoryODataOperations

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;

@end