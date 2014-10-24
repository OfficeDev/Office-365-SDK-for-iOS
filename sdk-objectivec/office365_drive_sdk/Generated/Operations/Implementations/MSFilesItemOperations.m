/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFilesItemOperations.h"

/**
* The implementation file for type MSFilesItemOperations.
*/

@implementation MSFilesItemOperations

-(id)initWith:(NSString *)urlComponent :(id<MSFilesODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
}


@end