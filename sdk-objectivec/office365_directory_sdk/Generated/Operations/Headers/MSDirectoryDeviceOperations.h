/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryDevice.h"
#import "MSDirectoryDirectoryObjectOperations.h"
#import "MSDirectoryAlternativeSecurityId.h"
#import "MSDirectoryDirectoryObject.h"

/**
* The header for type MSDirectoryDeviceOperations.
*/


@interface MSDirectoryDeviceOperations : MSDirectoryDirectoryObjectOperations

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;

@end