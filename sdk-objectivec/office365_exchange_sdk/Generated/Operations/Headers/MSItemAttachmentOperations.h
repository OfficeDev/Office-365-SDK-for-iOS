/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSItemAttachment.h"
#import "MSAttachmentOperations.h"
#import "MSItem.h"

/**
* The header for type MSItemAttachmentOperations.
*/


@interface MSItemAttachmentOperations : MSAttachmentOperations

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

@end