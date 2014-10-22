/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOContact.h"
#import "MSOItemOperations.h"
#import "MSOEmailAddress.h"
#import "MSOPhysicalAddress.h"

/**
* The header for type MSOContactOperations.
*/


@interface MSOContactOperations : MSOItemOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;

@end