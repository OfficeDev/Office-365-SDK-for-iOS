/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataOperations.h"
#import "MSOItem.h"
#import "MSOIdentitySet.h"
#import "MSOItemReference.h"


/**
* The header for type MSOItemOperations.
*/

@interface MSOItemOperations : MSOODataOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;

@end