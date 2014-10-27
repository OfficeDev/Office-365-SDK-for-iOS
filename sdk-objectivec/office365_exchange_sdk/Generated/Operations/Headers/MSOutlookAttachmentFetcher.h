/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookODataEntityFetcher.h"
#import "MSOutlookAttachmentOperations.h"
#import "MSOutlookAttachment.h"

#import "MSOutlookFileAttachmentFetcher.h"	
#import "MSOutlookItemAttachmentFetcher.h"	
/**
* The header for type MSOutlookAttachmentFetcher.
*/

@protocol MSOutlookAttachmentFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOutlookAttachment* attachment, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOutlookAttachment*, NSError * error))callback;
@end

@interface MSOutlookAttachmentFetcher : MSOutlookODataEntityFetcher<MSOutlookAttachmentFetcher>

-(MSOutlookAttachmentOperations*) getOperations;
		
-(MSOutlookFileAttachmentFetcher*) asFileAttachment;	
		
-(MSOutlookItemAttachmentFetcher*) asItemAttachment;	
	
@end