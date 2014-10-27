/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookODataExecutable.h"

/**
* The header for type MSOutlookODataOperations.
*/

@interface MSOutlookODataOperations : MSOutlookODataExecutable

-(id)initOperationWithUrl : (NSString*) urlComponent Parent: (id<MSOutlookODataExecutable>) parent;

@end
