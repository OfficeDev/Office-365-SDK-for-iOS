/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSharePointODataExecutable.h"

/**
* The header for type MSSharePointODataOperations.
*/

@interface MSSharePointODataOperations : MSSharePointODataExecutable

-(id)initOperationWithUrl : (NSString*) urlComponent Parent: (id<MSSharePointODataExecutable>) parent;

@end
