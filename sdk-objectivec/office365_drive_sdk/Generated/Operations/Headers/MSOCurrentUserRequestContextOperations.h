/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOCurrentUserRequestContext.h"
#import "MSOODataOperations.h"
#import "MSODrive.h"
#import "MSOItem.h"


/**
* The header for type MSOCurrentUserRequestContextOperations.
*/

@interface MSOCurrentUserRequestContextOperations : MSOODataOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;

@end