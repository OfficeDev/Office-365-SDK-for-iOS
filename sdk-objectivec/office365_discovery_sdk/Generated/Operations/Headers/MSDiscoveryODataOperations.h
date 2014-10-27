/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDiscoveryODataExecutable.h"

/**
* The header for type MSDiscoveryODataOperations.
*/

@interface MSDiscoveryODataOperations : MSDiscoveryODataExecutable

-(id)initOperationWithUrl : (NSString*) urlComponent Parent: (id<MSDiscoveryODataExecutable>) parent;

@end
