/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOFileAttachment.h"
#import "MSOODataOperations.h"


/**
* The header for type MSOFileAttachmentOperations.
*/

@interface MSOFileAttachmentOperations : MSOODataOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;

@end