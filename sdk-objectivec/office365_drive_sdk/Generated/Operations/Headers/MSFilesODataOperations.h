/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFilesODataExecutable.h"

/**
* The header for type MSFilesODataOperations.
*/

@interface MSFilesODataOperations : MSFilesODataExecutable

-(id)initOperationWithUrl : (NSString*) urlComponent Parent: (id<MSFilesODataExecutable>) parent;

@end
