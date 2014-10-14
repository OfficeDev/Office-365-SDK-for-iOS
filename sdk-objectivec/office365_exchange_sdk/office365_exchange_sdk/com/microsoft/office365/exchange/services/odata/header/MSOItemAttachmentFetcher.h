/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataEntityFetcher.h"
#import "MSOItemAttachmentOperations.h"
#import "MSOItemAttachment.h"

@class MSOItemFetcher;

@interface MSOItemAttachmentFetcher : MSOODataEntityFetcher

-(MSOItemAttachmentOperations*) getOperations;
-(NSURLSessionDataTask *)execute:(void (^)(MSOItemAttachment* itemAttachment, NSError *error))callback;

-(MSOItemFetcher*) getItem;
@end