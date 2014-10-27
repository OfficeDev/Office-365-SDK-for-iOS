/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookAttachment.h"
#import "MSOutlookEntityOperations.h"

/**
* The header for type MSOutlookAttachmentOperations.
*/


@interface MSOutlookAttachmentOperations : MSOutlookEntityOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;

@end