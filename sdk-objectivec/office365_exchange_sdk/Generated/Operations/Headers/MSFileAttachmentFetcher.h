/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"
#import "MSFileAttachmentOperations.h"
#import "MSFileAttachment.h"

/**
* The header for type MSFileAttachmentFetcher.
*/

@protocol MSFileAttachmentFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSFileAttachment* fileAttachment, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSFileAttachment*, NSError * error))callback;
@end

@interface MSFileAttachmentFetcher : MSODataEntityFetcher<MSFileAttachmentFetcher>

-(MSFileAttachmentOperations*) getOperations;
	
@end