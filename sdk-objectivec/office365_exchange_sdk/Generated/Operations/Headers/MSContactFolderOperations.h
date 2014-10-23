/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSContactFolder.h"
#import "MSEntityOperations.h"
#import "MSContact.h"
#import "MSContactFolder.h"

/**
* The header for type MSContactFolderOperations.
*/


@interface MSContactFolderOperations : MSEntityOperations

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

@end