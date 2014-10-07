/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "ODataOperations.h"
#import "Item.h"

@interface ItemAttachmentOperations : ODataOperations

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent;

@end