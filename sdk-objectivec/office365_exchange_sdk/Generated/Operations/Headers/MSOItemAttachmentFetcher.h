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

@protocol MSOItemAttachmentFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOItemAttachment* itemAttachment, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOItemAttachment*, NSError * error))callback;
@end

@interface MSOItemAttachmentFetcher : MSOODataEntityFetcher<MSOItemAttachmentFetcher>

-(MSOItemAttachmentOperations*) getOperations;
-(MSOItemFetcher*) getItem;
	
@end