/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 *
 * Warning: This code was generated automatically. Edits will be overwritten.
 * To make changes to this code, please make changes to the generation framework itself:
 * https://github.com/MSOpenTech/odata-codegen
 *******************************************************************************/

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
-(NSURLSessionDataTask *)read:(void (^)(MSOutlookAttachment* attachment, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOutlookAttachment*, NSError * error))callback;
@end

@interface MSOutlookAttachmentFetcher : MSOutlookODataEntityFetcher<MSOutlookAttachmentFetcher>

-(MSOutlookAttachmentOperations*) getOperations;
		
-(MSOutlookFileAttachmentFetcher*) asFileAttachment;	
		
-(MSOutlookItemAttachmentFetcher*) asItemAttachment;	
	
@end