/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataExecutable.h"

/**
* The header for type MSODataOperations.
*/

@interface MSODataOperations : MSODataExecutable

-(id)initOperationWithUrl : (NSString*) urlComponent Parent: (id<MSODataExecutable>) parent;

@end
