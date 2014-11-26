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
#import "MSOutlookFileAttachment.h"
#import "MSOutlookFileAttachmentFetcher.h"

/**
* The header for type MSOutlookFileAttachmentCollectionFetcher.
*/

@protocol MSOutlookFileAttachmentCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOutlookFileAttachment> *fileAttachments, NSError *error))callback;

@end

@interface MSOutlookFileAttachmentCollectionFetcher : MSODataCollectionFetcher<MSOutlookFileAttachmentCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSOutlookFileAttachment* )entity withCallback:(void (^)(MSOutlookFileAttachment *fileAttachment, NSError *e))callback;

-(MSOutlookFileAttachmentFetcher*)getById:(NSString *)Id;

@end