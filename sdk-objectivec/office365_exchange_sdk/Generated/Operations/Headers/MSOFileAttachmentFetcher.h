/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataEntityFetcher.h"
#import "MSOFileAttachmentOperations.h"
#import "MSOFileAttachment.h"

/**
* The header for type MSOFileAttachmentFetcher.
*/

@protocol MSOFileAttachmentFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOFileAttachment* fileAttachment, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOFileAttachment*, NSError * error))callback;
@end

@interface MSOFileAttachmentFetcher : MSOODataEntityFetcher<MSOFileAttachmentFetcher>

-(MSOFileAttachmentOperations*) getOperations;
	
@end