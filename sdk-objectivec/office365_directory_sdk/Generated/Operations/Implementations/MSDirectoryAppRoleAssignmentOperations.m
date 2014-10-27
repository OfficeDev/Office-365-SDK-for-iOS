/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryAppRoleAssignmentOperations.h"

/**
* The implementation file for type MSDirectoryAppRoleAssignmentOperations.
*/

@implementation MSDirectoryAppRoleAssignmentOperations

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
}


@end