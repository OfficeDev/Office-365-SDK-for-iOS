/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryDeviceConfigurationOperations.h"

/**
* The implementation file for type MSDirectoryDeviceConfigurationOperations.
*/

@implementation MSDirectoryDeviceConfigurationOperations

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
}


@end