/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSAttachment.h"
#import "MSEntityOperations.h"

/**
* The header for type MSAttachmentOperations.
*/


@interface MSAttachmentOperations : MSEntityOperations

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

@end