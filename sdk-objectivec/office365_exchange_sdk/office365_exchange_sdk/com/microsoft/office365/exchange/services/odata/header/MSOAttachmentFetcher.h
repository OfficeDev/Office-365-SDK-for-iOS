/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataEntityFetcher.h"
#import "MSOAttachmentOperations.h"
#import "MSOAttachment.h"


@interface MSOAttachmentFetcher : MSOODataEntityFetcher

-(MSOAttachmentOperations*) getOperations;
-(NSURLSessionDataTask *)execute:(void (^)(MSOAttachment* attachment, NSError *error))callback;

@end