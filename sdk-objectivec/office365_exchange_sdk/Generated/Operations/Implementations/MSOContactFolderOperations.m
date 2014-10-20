/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOContactFolderOperations.h"
#import "MSOBaseODataContainerHelper.h"

/**
* The implementation file for type MSOContactFolderOperations.
*/

@implementation MSOContactFolderOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
}


@end