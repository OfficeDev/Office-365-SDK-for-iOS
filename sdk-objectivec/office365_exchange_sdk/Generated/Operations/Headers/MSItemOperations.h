/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSItem.h"
#import "MSEntityOperations.h"

/**
* The header for type MSItemOperations.
*/


@interface MSItemOperations : MSEntityOperations

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

@end