/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookODataEntityFetcher.h"
#import "MSOutlookItemAttachmentOperations.h"
#import "MSOutlookItemAttachment.h"
@class MSOutlookItemFetcher;

/**
* The header for type MSOutlookItemAttachmentFetcher.
*/

@protocol MSOutlookItemAttachmentFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOutlookItemAttachment* itemAttachment, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOutlookItemAttachment*, NSError * error))callback;
@end

@interface MSOutlookItemAttachmentFetcher : MSOutlookODataEntityFetcher<MSOutlookItemAttachmentFetcher>

-(MSOutlookItemAttachmentOperations*) getOperations;
-(MSOutlookItemFetcher*) getItem;
	
@end