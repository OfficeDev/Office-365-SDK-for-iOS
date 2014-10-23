/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSItemAttachment.h"
#import "MSODataCollectionFetcher.h"
#import "MSItemAttachmentFetcher.h"

/**
* The header for type MSItemAttachmentCollectionFetcher.
*/

@protocol MSItemAttachmentCollectionFetcher

@optional
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSItemAttachment> *itemAttachments, NSError *error))callback;

@end

@interface MSItemAttachmentCollectionFetcher : MSODataCollectionFetcher<MSItemAttachmentCollectionFetcher>

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSItemAttachment* )entity :(void (^)(MSItemAttachment *itemAttachment, NSError *e))callback;

-(MSItemAttachmentFetcher*)getById:(NSString *)Id;

@end
