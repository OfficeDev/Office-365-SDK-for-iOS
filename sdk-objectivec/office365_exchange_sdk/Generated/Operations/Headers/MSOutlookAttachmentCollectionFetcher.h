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

#import "MSOutlookAttachment.h"
#import "MSOutlookODataCollectionFetcher.h"
#import "MSOutlookAttachmentFetcher.h"

/**
* The header for type MSOutlookAttachmentCollectionFetcher.
*/

@protocol MSOutlookAttachmentCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOutlookAttachment> *attachments, NSError *error))callback;

@end

@interface MSOutlookAttachmentCollectionFetcher : MSOutlookODataCollectionFetcher<MSOutlookAttachmentCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataReadable>)parent;

-(NSURLSessionDataTask*)add:(MSOutlookAttachment* )entity :(void (^)(MSOutlookAttachment *attachment, NSError *e))callback;

-(MSOutlookAttachmentFetcher*)getById:(NSString *)Id;

@end
