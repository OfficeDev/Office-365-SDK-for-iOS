/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOFileAttachment.h"
#import "MSOAttachmentOperations.h"

/**
* The header for type MSOFileAttachmentOperations.
*/


@interface MSOFileAttachmentOperations : MSOAttachmentOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;

@end