/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookEntity.h"
#import "MSOutlookODataOperations.h"

/**
* The header for type MSOutlookEntityOperations.
*/


@interface MSOutlookEntityOperations : MSOutlookODataOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;

@end