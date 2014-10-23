/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataExecutable.h"

/**
* The header for type MSOODataOperations.
*/

@interface MSOODataOperations : MSOODataExecutable

-(id)initOperationWithUrl : (NSString*) urlComponent Parent: (id<MSOODataExecutable>) parent;

@end
