/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookFileAttachment.h"
#import "MSOutlookAttachmentOperations.h"

/**
* The header for type MSOutlookFileAttachmentOperations.
*/


@interface MSOutlookFileAttachmentOperations : MSOutlookAttachmentOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;

@end