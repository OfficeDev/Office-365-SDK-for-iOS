/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookFileAttachment.h"
#import "MSOutlookODataCollectionFetcher.h"
#import "MSOutlookFileAttachmentFetcher.h"

/**
* The header for type MSOutlookFileAttachmentCollectionFetcher.
*/

@protocol MSOutlookFileAttachmentCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOutlookFileAttachment> *fileAttachments, NSError *error))callback;

@end

@interface MSOutlookFileAttachmentCollectionFetcher : MSOutlookODataCollectionFetcher<MSOutlookFileAttachmentCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSOutlookFileAttachment* )entity :(void (^)(MSOutlookFileAttachment *fileAttachment, NSError *e))callback;

-(MSOutlookFileAttachmentFetcher*)getById:(NSString *)Id;

@end
