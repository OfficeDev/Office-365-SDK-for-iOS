/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOServiceInfo.h"
#import "MSOODataOperations.h"

/**
* The header for type MSOServiceInfoOperations.
*/


@interface MSOServiceInfoOperations : MSOODataOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;

@end