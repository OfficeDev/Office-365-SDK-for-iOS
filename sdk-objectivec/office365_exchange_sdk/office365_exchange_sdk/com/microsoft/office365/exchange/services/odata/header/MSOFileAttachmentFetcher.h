/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataEntityFetcher.h"
#import "MSOFileAttachmentOperations.h"
#import "MSOFileAttachment.h"


@interface MSOFileAttachmentFetcher : MSOODataEntityFetcher

-(MSOFileAttachmentOperations*) getOperations;
-(NSURLSessionDataTask *)execute:(void (^)(MSOFileAttachment* fileAttachment, NSError *error))callback;

@end