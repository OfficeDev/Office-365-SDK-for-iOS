/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFileAttachment.h"
#import "MSAttachmentOperations.h"

/**
* The header for type MSFileAttachmentOperations.
*/


@interface MSFileAttachmentOperations : MSAttachmentOperations

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

@end