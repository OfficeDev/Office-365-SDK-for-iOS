/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSharePointItem.h"
#import "MSSharePointODataOperations.h"
#import "MSSharePointIdentitySet.h"
#import "MSSharePointItemReference.h"

/**
* The header for type MSSharePointItemOperations.
*/


@interface MSSharePointItemOperations : MSSharePointODataOperations

-(id)initWith:(NSString *)urlComponent :(id<MSSharePointODataExecutable>)parent;

@end