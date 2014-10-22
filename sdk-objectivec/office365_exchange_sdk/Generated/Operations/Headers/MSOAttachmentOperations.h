/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOAttachment.h"
#import "MSOEntityOperations.h"

/**
* The header for type MSOAttachmentOperations.
*/


@interface MSOAttachmentOperations : MSOEntityOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;

@end