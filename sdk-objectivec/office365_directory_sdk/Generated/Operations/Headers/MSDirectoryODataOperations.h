/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryODataExecutable.h"

/**
* The header for type MSDirectoryODataOperations.
*/

@interface MSDirectoryODataOperations : MSDirectoryODataExecutable

-(id)initOperationWithUrl : (NSString*) urlComponent Parent: (id<MSDirectoryODataExecutable>) parent;

@end
