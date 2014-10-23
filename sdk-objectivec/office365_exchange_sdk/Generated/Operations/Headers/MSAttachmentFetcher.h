/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"
#import "MSAttachmentOperations.h"
#import "MSAttachment.h"

#import "MSFileAttachmentFetcher.h"	
#import "MSItemAttachmentFetcher.h"	
/**
* The header for type MSAttachmentFetcher.
*/

@protocol MSAttachmentFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSAttachment* attachment, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSAttachment*, NSError * error))callback;
@end

@interface MSAttachmentFetcher : MSODataEntityFetcher<MSAttachmentFetcher>

-(MSAttachmentOperations*) getOperations;
		
-(MSFileAttachmentFetcher*) asFileAttachment;	
		
-(MSItemAttachmentFetcher*) asItemAttachment;	
	
@end