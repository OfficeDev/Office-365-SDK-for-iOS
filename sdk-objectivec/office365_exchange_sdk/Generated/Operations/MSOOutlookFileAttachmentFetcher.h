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
#import "MSOOutlookFileAttachmentOperations.h"
#import "MSOOutlookFileAttachment.h"


/**
* The header for type MSOOutlookFileAttachmentFetcher.
*/

@protocol MSOOutlookFileAttachmentFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOOutlookFileAttachment* fileAttachment, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOOutlookFileAttachment*, NSError * error))callback;
@end

@interface MSOOutlookFileAttachmentFetcher : MSODataEntityFetcher<MSOOutlookFileAttachmentFetcher>

-(MSOOutlookFileAttachmentOperations*) getOperations;

	
@end