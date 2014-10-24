/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFilesItem.h"
#import "MSFilesODataOperations.h"
#import "MSFilesIdentitySet.h"
#import "MSFilesItemReference.h"

/**
* The header for type MSFilesItemOperations.
*/


@interface MSFilesItemOperations : MSFilesODataOperations

-(id)initWith:(NSString *)urlComponent :(id<MSFilesODataExecutable>)parent;

@end