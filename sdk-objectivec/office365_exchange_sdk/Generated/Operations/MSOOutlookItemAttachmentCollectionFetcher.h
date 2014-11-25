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
#import "MSOOutlookItemAttachment.h"
#import "MSOOutlookItemAttachmentFetcher.h"

/**
* The header for type MSOOutlookItemAttachmentCollectionFetcher.
*/

@protocol MSOOutlookItemAttachmentCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOOutlookItemAttachment> *itemAttachments, NSError *error))callback;

@end

@interface MSOOutlookItemAttachmentCollectionFetcher : MSODataCollectionFetcher<MSOOutlookItemAttachmentCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSOOutlookItemAttachment* )entity withCallback:(void (^)(MSOOutlookItemAttachment *itemAttachment, NSError *e))callback;

-(MSOOutlookItemAttachmentFetcher*)getById:(NSString *)Id;

@end