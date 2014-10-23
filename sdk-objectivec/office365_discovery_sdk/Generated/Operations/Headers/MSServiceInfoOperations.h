/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSServiceInfo.h"
#import "MSODataOperations.h"

/**
* The header for type MSServiceInfoOperations.
*/


@interface MSServiceInfoOperations : MSODataOperations

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

@end