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

@class MSOutlookFileAttachmentOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSOutlookModels.h"

/**
* The header for type MSOutlookFileAttachmentFetcher.
*/


@protocol MSOutlookFileAttachmentFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSOutlookFileAttachment* fileAttachment, MSODataException *error))callback;
-(NSURLSessionTask*) updateFileAttachment:(id)entity withCallback:(void (^)(MSOutlookFileAttachment*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteFileAttachment:(void (^)(int status, MSODataException * error))callback;
-(id<MSOutlookFileAttachmentFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSOutlookFileAttachmentFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSOutlookFileAttachmentFetcher>)select : (NSString*) params;
-(id<MSOutlookFileAttachmentFetcher>)expand : (NSString*) value;

@required
-(MSOutlookFileAttachmentOperations*) getOperations;
@end

@interface MSOutlookFileAttachmentFetcher : MSODataEntityFetcher<MSOutlookFileAttachmentFetcher>

@end