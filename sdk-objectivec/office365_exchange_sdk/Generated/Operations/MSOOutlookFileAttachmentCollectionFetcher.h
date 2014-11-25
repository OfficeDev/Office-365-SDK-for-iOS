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
#import "MSOOutlookFileAttachment.h"
#import "MSOOutlookFileAttachmentFetcher.h"

/**
* The header for type MSOOutlookFileAttachmentCollectionFetcher.
*/

@protocol MSOOutlookFileAttachmentCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOOutlookFileAttachment> *fileAttachments, NSError *error))callback;

@end

@interface MSOOutlookFileAttachmentCollectionFetcher : MSODataCollectionFetcher<MSOOutlookFileAttachmentCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSOOutlookFileAttachment* )entity withCallback:(void (^)(MSOOutlookFileAttachment *fileAttachment, NSError *e))callback;

-(MSOOutlookFileAttachmentFetcher*)getById:(NSString *)Id;

@end