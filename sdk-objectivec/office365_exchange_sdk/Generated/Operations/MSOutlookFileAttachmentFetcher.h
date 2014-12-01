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
#import "MSOutlookFileAttachmentOperations.h"
#import "MSOutlookFileAttachment.h"


/**
* The header for type MSOutlookFileAttachmentFetcher.
*/

@protocol MSOutlookFileAttachmentFetcher

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSOutlookFileAttachment* fileAttachment, MSODataException *error))callback;
-(NSURLSessionDataTask*) updateFileAttachment:(id)entity withCallback:(void (^)(MSOutlookFileAttachment*, MSODataException * error))callback;
-(NSURLSessionDataTask*) deleteFileAttachment:(void (^)(int status, MSODataException * error))callback;
-(id<MSOutlookFileAttachmentFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSOutlookFileAttachmentFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@end

@interface MSOutlookFileAttachmentFetcher : MSODataEntityFetcher<MSOutlookFileAttachmentFetcher>

-(MSOutlookFileAttachmentOperations*) getOperations;

	
@end