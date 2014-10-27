/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryDeviceConfiguration.h"
#import "MSDirectoryDirectoryObjectOperations.h"

/**
* The header for type MSDirectoryDeviceConfigurationOperations.
*/


@interface MSDirectoryDeviceConfigurationOperations : MSDirectoryDirectoryObjectOperations

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;

@end