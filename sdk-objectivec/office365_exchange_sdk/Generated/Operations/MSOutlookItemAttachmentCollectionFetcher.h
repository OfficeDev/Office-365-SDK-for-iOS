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
#import "MSOutlookItemAttachment.h"
#import "MSOutlookItemAttachmentFetcher.h"

/**
* The header for type MSOutlookItemAttachmentCollectionFetcher.
*/

@protocol MSOutlookItemAttachmentCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOutlookItemAttachment> *itemAttachments, NSError *error))callback;

@end

@interface MSOutlookItemAttachmentCollectionFetcher : MSODataCollectionFetcher<MSOutlookItemAttachmentCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSOutlookItemAttachment* )entity withCallback:(void (^)(MSOutlookItemAttachment *itemAttachment, NSError *e))callback;

-(MSOutlookItemAttachmentFetcher*)getById:(NSString *)Id;

@end