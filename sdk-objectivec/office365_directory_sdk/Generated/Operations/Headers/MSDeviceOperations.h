/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDevice.h"
#import "MSDirectoryObjectOperations.h"
#import "MSAlternativeSecurityId.h"
#import "MSDirectoryObject.h"

/**
* The header for type MSDeviceOperations.
*/


@interface MSDeviceOperations : MSDirectoryObjectOperations

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

@end