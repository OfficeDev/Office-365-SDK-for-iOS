/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDiscoveryServiceInfoOperations.h"

/**
* The implementation file for type MSDiscoveryServiceInfoOperations.
*/

@implementation MSDiscoveryServiceInfoOperations

-(id)initWith:(NSString *)urlComponent :(id<MSDiscoveryODataExecutable>)parent{
    return [super initOperationWithUrl:urlComponent Parent:parent];
}


@end