/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryExtensionPropertyOperations.h"

/**
* The implementation file for type MSDirectoryExtensionPropertyOperations.
*/

@implementation MSDirectoryExtensionPropertyOperations

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
}


@end