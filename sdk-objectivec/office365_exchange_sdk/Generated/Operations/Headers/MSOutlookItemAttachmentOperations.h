/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookItemAttachment.h"
#import "MSOutlookAttachmentOperations.h"
#import "MSOutlookItem.h"

/**
* The header for type MSOutlookItemAttachmentOperations.
*/


@interface MSOutlookItemAttachmentOperations : MSOutlookAttachmentOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;

@end