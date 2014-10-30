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

#import "MSOutlookFileAttachment.h"
#import "MSOutlookODataCollectionFetcher.h"
#import "MSOutlookFileAttachmentFetcher.h"

/**
* The header for type MSOutlookFileAttachmentCollectionFetcher.
*/

@protocol MSOutlookFileAttachmentCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOutlookFileAttachment> *fileAttachments, NSError *error))callback;

@end

@interface MSOutlookFileAttachmentCollectionFetcher : MSOutlookODataCollectionFetcher<MSOutlookFileAttachmentCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataReadable>)parent;

-(NSURLSessionDataTask*)add:(MSOutlookFileAttachment* )entity :(void (^)(MSOutlookFileAttachment *fileAttachment, NSError *e))callback;

-(MSOutlookFileAttachmentFetcher*)getById:(NSString *)Id;

@end
