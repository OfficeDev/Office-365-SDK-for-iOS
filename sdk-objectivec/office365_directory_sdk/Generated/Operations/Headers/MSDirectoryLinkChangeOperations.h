/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryLinkChange.h"
#import "MSDirectoryObjectOperations.h"

/**
* The header for type MSDirectoryLinkChangeOperations.
*/


@interface MSDirectoryLinkChangeOperations : MSDirectoryObjectOperations

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

@end