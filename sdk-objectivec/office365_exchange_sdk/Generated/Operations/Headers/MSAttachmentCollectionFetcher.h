/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSAttachment.h"
#import "MSODataCollectionFetcher.h"
#import "MSAttachmentFetcher.h"

/**
* The header for type MSAttachmentCollectionFetcher.
*/

@protocol MSAttachmentCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSAttachment> *attachments, NSError *error))callback;

@end

@interface MSAttachmentCollectionFetcher : MSODataCollectionFetcher<MSAttachmentCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSAttachment* )entity :(void (^)(MSAttachment *attachment, NSError *e))callback;

-(MSAttachmentFetcher*)getById:(NSString *)Id;

@end
