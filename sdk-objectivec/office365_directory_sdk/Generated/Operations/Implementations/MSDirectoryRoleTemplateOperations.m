/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryRoleTemplateOperations.h"

/**
* The implementation file for type MSDirectoryRoleTemplateOperations.
*/

@implementation MSDirectoryRoleTemplateOperations

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
}


@end