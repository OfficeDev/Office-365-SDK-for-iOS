/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import "MSOODataEntityFetcher.h"
#import "MSOItemAttachmentOperations.h"
#import "MSOItemAttachment.h"

@class MSOItemFetcher;


/**
* The header for type MSOItemAttachmentFetcher.
*/

@interface MSOItemAttachmentFetcher : MSOODataEntityFetcher

-(MSOItemAttachmentOperations*) getOperations;

-(MSOItemFetcher*) getItem;
@end