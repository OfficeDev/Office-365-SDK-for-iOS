/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryOAuth2PermissionGrantOperations.h"

/**
* The implementation file for type MSDirectoryOAuth2PermissionGrantOperations.
*/

@implementation MSDirectoryOAuth2PermissionGrantOperations

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
}


@end