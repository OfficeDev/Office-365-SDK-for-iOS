/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFileAttachment.h"
#import "MSODataCollectionFetcher.h"
#import "MSFileAttachmentFetcher.h"

/**
* The header for type MSFileAttachmentCollectionFetcher.
*/

@protocol MSFileAttachmentCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSFileAttachment> *fileAttachments, NSError *error))callback;

@end

@interface MSFileAttachmentCollectionFetcher : MSODataCollectionFetcher<MSFileAttachmentCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSFileAttachment* )entity :(void (^)(MSFileAttachment *fileAttachment, NSError *e))callback;

-(MSFileAttachmentFetcher*)getById:(NSString *)Id;

@end
