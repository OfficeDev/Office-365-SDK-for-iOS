/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOItemAttachment.h"
#import "MSOODataOperations.h"
#import "MSOItem.h"


/**
* The header for type MSOItemAttachmentOperations.
*/

@interface MSOItemAttachmentOperations : MSOODataOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;

@end