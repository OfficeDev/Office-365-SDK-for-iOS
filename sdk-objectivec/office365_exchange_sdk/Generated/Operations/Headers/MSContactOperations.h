/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSContact.h"
#import "MSItemOperations.h"
#import "MSEmailAddress.h"
#import "MSPhysicalAddress.h"

/**
* The header for type MSContactOperations.
*/


@interface MSContactOperations : MSItemOperations

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

@end