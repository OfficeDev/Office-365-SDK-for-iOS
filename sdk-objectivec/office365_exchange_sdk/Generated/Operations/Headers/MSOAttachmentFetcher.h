/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import "MSOODataEntityFetcher.h"
#import "MSOAttachmentOperations.h"
#import "MSOAttachment.h"



/**
* The header for type MSOAttachmentFetcher.
*/


@protocol MSOAttachmentFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOAttachment* attachment, NSError *error))callback;

@end

@interface MSOAttachmentFetcher : MSOODataEntityFetcher<MSOAttachmentFetcher>

-(MSOAttachmentOperations*) getOperations;

@end