/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOAttachmentOperations.h"
#import "MSOAttachment.h"

/**
* The header for type MSOAttachmentFetcher.
*/

@interface MSOAttachmentFetcher : MSOODataEntityFetcher

-(MSOAttachmentOperations*) getOperations;
-(NSURLSessionDataTask *)execute:(void (^)(MSOAttachment* attachment, NSError *error))callback;

@end