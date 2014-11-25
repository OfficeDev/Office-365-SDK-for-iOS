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
#import "MSOOutlookAttachment.h"
#import "MSOOutlookAttachmentFetcher.h"

/**
* The header for type MSOOutlookAttachmentCollectionFetcher.
*/

@protocol MSOOutlookAttachmentCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOOutlookAttachment> *attachments, NSError *error))callback;

@end

@interface MSOOutlookAttachmentCollectionFetcher : MSODataCollectionFetcher<MSOOutlookAttachmentCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSOOutlookAttachment* )entity withCallback:(void (^)(MSOOutlookAttachment *attachment, NSError *e))callback;

-(MSOOutlookAttachmentFetcher*)getById:(NSString *)Id;

@end