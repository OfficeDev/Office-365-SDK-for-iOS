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

#import <office365_odata_base/office365_odata_base.h>
#import "MSOOutlookAttachmentOperations.h"
#import "MSOOutlookAttachment.h"


#import "MSOOutlookFileAttachmentFetcher.h"
#import "MSOOutlookItemAttachmentFetcher.h"
/**
* The header for type MSOOutlookAttachmentFetcher.
*/

@protocol MSOOutlookAttachmentFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOOutlookAttachment* attachment, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOOutlookAttachment*, NSError * error))callback;
@end

@interface MSOOutlookAttachmentFetcher : MSODataEntityFetcher<MSOOutlookAttachmentFetcher>

-(MSOOutlookAttachmentOperations*) getOperations;

	
	
-(MSOOutlookFileAttachmentFetcher*) asFileAttachment;	
	
	
-(MSOOutlookItemAttachmentFetcher*) asItemAttachment;	
	
@end