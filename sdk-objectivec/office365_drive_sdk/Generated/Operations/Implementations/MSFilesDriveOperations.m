/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFilesDriveOperations.h"

/**
* The implementation file for type MSFilesDriveOperations.
*/

@implementation MSFilesDriveOperations

-(id)initWith:(NSString *)urlComponent :(id<MSFilesODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
}


@end