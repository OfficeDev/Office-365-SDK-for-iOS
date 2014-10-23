/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSItem.h"
#import "MSODataOperations.h"
#import "MSIdentitySet.h"
#import "MSItemReference.h"

/**
* The header for type MSItemOperations.
*/


@interface MSItemOperations : MSODataOperations

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

@end