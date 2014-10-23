/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"
#import "MSItemAttachmentOperations.h"
#import "MSItemAttachment.h"
@class MSItemFetcher;

/**
* The header for type MSItemAttachmentFetcher.
*/

@protocol MSItemAttachmentFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSItemAttachment* itemAttachment, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSItemAttachment*, NSError * error))callback;
@end

@interface MSItemAttachmentFetcher : MSODataEntityFetcher<MSItemAttachmentFetcher>

-(MSItemAttachmentOperations*) getOperations;
-(MSItemFetcher*) getItem;
	
@end