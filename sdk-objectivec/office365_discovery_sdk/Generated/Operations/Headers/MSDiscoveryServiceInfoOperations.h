/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDiscoveryServiceInfo.h"
#import "MSDiscoveryODataOperations.h"

/**
* The header for type MSDiscoveryServiceInfoOperations.
*/


@interface MSDiscoveryServiceInfoOperations : MSDiscoveryODataOperations

-(id)initWith:(NSString *)urlComponent :(id<MSDiscoveryODataExecutable>)parent;

@end