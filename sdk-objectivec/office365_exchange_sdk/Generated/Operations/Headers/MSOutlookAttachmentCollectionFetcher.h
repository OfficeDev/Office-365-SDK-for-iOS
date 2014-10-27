/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookAttachment.h"
#import "MSOutlookODataCollectionFetcher.h"
#import "MSOutlookAttachmentFetcher.h"

/**
* The header for type MSOutlookAttachmentCollectionFetcher.
*/

@protocol MSOutlookAttachmentCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOutlookAttachment> *attachments, NSError *error))callback;

@end

@interface MSOutlookAttachmentCollectionFetcher : MSOutlookODataCollectionFetcher<MSOutlookAttachmentCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSOutlookAttachment* )entity :(void (^)(MSOutlookAttachment *attachment, NSError *e))callback;

-(MSOutlookAttachmentFetcher*)getById:(NSString *)Id;

@end
