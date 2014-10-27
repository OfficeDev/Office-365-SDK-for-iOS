/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookODataEntityFetcher.h"
#import "MSOutlookFileAttachmentOperations.h"
#import "MSOutlookFileAttachment.h"

/**
* The header for type MSOutlookFileAttachmentFetcher.
*/

@protocol MSOutlookFileAttachmentFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOutlookFileAttachment* fileAttachment, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOutlookFileAttachment*, NSError * error))callback;
@end

@interface MSOutlookFileAttachmentFetcher : MSOutlookODataEntityFetcher<MSOutlookFileAttachmentFetcher>

-(MSOutlookFileAttachmentOperations*) getOperations;
	
@end